package com.phananhtai.shoppingOnline_service.controller;

import com.phananhtai.shoppingOnline_service.dao.*;
import com.phananhtai.shoppingOnline_service.dto.ShoppingCartDTO;
import com.phananhtai.shoppingOnline_service.entity.*;
import com.phananhtai.shoppingOnline_service.service.SessionService;
import com.phananhtai.shoppingOnline_service.service.ShoppingCartService;
import com.phananhtai.shoppingOnline_service.utils.OrderUtils;
import com.phananhtai.shoppingOnline_service.vnpay.VNPAYService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class checkOutController {
    @Autowired
    ShoppingCartService cart;
    @Autowired
    SessionService session;
    @Autowired
    OderStatusDAO oderStatusDAO;
    @Autowired
    AccountDAO accountDAO;
    @Autowired
    OrderDAO orderDAO;
    @Autowired
    ProductDAO productDAO;
    @Autowired
    OrderDetailDAO orderDetailDAO;
    @Autowired
    private VNPAYService vnPayService;

    @GetMapping("/checkout")
    public String showCheckOut(Model model){
        model.addAttribute("cart", cart.getProducts());
        model.addAttribute("amount",cart.getAmount());
        return "checkout";
    }
    @GetMapping("/cart/add/{id}")
    public String add(@PathVariable("id") Integer id) {
        cart.add(id);
        return "redirect:/checkout"; // hiển thị giỏ hàng
    }
    @GetMapping("/cart/remove/{id}")
    public String remove(@PathVariable("id") Integer id) {
        cart.remove(id);
        return "redirect:/checkout";
    }
    @GetMapping("/cart/clear")
    public String clear() {
        cart.clear();
        return "redirect:/checkout";
    }
    @PostMapping("/cart/update/{id}")
    public String update(@PathVariable int id, @RequestParam("qty") int qty) {
        cart.update(id,qty);
        return "redirect:/checkout";
    }




    @PostMapping("/checkout")
    public String handleCheckout(@RequestParam("address") String address,
                                 @RequestParam("phone") Integer phone,
                                 @RequestParam("payment") String paymentMethod,
                                 @RequestParam("fullname") String fullName,
                                 RedirectAttributes redirectAttributes,
                                 HttpServletRequest request,
                                 Model model) {

        if(cart.getCount() > 0) {
            Account account = session.get("user") == null ? null : (Account) session.get("user");

            Order order = createOrder(account, address,fullName, phone, cart.getAmount());
            List<OrderDetail> orderDetails = createOrderDetails(order, new ArrayList<>(cart.getProducts()));
            order.setOrderDetails(orderDetails);

            Order orderReturn = orderDAO.save(order);


            if(paymentMethod.equals("cash")) {
                cart.clear();
                model.addAttribute("success", "Đặt hàng thành công");
                model.addAttribute("order",orderReturn);
                return "oderSuccessFul";
            } else if(paymentMethod.equals("bank")) {
                String OderInfo = "Shopping Online - Thanh toan don hang "+(int) Math.round(cart.getAmount() * 1000);
                int totalPrice = (int) Math.round(cart.getAmount() * 1000);
                String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
                String vnpayUrl = vnPayService.createOrder(totalPrice, OderInfo, baseUrl);

                // Lưu thông tin đơn hàng tạm thời để xác nhận sau khi thanh toán thành công
                session.set("pendingOrder", order);
                session.set("orderDetails", orderDetails);

                return "redirect:" + vnpayUrl;
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "Không có sản phẩm nào trong giỏ hàng");
        }

        return "redirect:/checkout";
    }

    private Order createOrder(Account account, String address,String fullName, Integer phone, double totalPrice) {
        Order order = new Order();
        order.setAccount(account);
        order.setAddress(address);
        order.setPhone(phone);
        order.setOderCode(OrderUtils.generateOrderCode());
        order.setTotalPrice(totalPrice);
        order.setFullName(fullName);

        Optional<OrderStatus> optionalOrderStatus = oderStatusDAO.findById(1L);
        optionalOrderStatus.ifPresent(order::setOrderStatus);

        return order;
    }

    private List<OrderDetail> createOrderDetails(Order order, List<ShoppingCartDTO> cartItems) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        for (ShoppingCartDTO cartItem : cartItems) {
            Product product = productDAO.getProductByIdAndActive(cartItem.getId(), true);
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProduct(product);
            orderDetail.setQuantity(cartItem.getQty());
            orderDetail.setOrder(order);
            orderDetail.setPrice(cartItem.getPrice());
            orderDetails.add(orderDetail);
        }
        return orderDetails;
    }


    @GetMapping("/vnpay-payment")
    public String GetMapping(HttpServletRequest request, Model model){
        int paymentStatus =vnPayService.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);


        if (paymentStatus == 1) {
            // Lấy thông tin đơn hàng từ session
            Order order = (Order) session.get("pendingOrder");
            List<OrderDetail> orderDetails = (List<OrderDetail>) session.get("orderDetails");

            // Lưu đơn hàng vào cơ sở dữ liệu
            order.setOrderStatus(oderStatusDAO.findById(2L).orElse(null)); // Cập nhật trạng thái đơn hàng thành đã thanh toán
            Order orderReturn=orderDAO.save(order);
            for (OrderDetail orderDetail : orderDetails) {
                orderDetailDAO.save(orderDetail);
            }

            // Xóa thông tin đơn hàng tạm thời khỏi session
            session.remove("pendingOrder");
            session.remove("orderDetails");

            cart.clear();
            model.addAttribute("success", "Thanh toán thành công ");
            model.addAttribute("order",orderReturn);
            return "oderSuccessFul";
        } else {
            return "orderFail";
        }
    }

}


