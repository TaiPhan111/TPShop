package com.phananhtai.shoppingOnline_service.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderUtils {
    // Hàm tạo chuỗi mã đơn hàng
    public static String generateOrderCode() {
        // Lấy thời gian hiện tại
        Date now = new Date();
        // Định dạng thời gian thành chuỗi
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = dateFormat.format(now);

        // Tạo một chuỗi số ngẫu nhiên
        Random random = new Random();
        int randomNumber = random.nextInt(9000) + 1000; // Số ngẫu nhiên từ 1000 đến 9999

        // Kết hợp thời gian và số ngẫu nhiên để tạo mã đơn hàng
        String orderCode = "OD" + timestamp + randomNumber;

        return orderCode;
    }
    public static String generateImage() {
        // Lấy thời gian hiện tại
        Date now = new Date();
        // Định dạng thời gian thành chuỗi
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = dateFormat.format(now);

        // Tạo một chuỗi số ngẫu nhiên
        Random random = new Random();
        int randomNumber = random.nextInt(9000) + 1000; // Số ngẫu nhiên từ 1000 đến 9999

        // Kết hợp thời gian và số ngẫu nhiên để tạo mã đơn hàng
        String orderCode = "IM" + timestamp + randomNumber;

        return orderCode;
    }

    // Hàm main để kiểm tra
    public static void main(String[] args) {
        String orderCode = generateOrderCode();
        System.out.println("Generated Order Code: " + orderCode);
    }
}
