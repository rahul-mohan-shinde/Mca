package com.socialmedia.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class TestAJAX {
    public static void main(String[] args) {
        try {
            System.out.println("=== TESTING LIKE SERVLET ===");
            
            URL url = new URL("http://localhost:8080/YourProjectName/like");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            
            String data = "postId=1&action=toggle";
            
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = data.getBytes("utf-8");
                os.write(input, 0, input.length);
            }
            
            int status = conn.getResponseCode();
            System.out.println("Response Code: " + status);
            
            try (BufferedReader br = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                System.out.println("Response: " + response.toString());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}