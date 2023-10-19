package com.poly;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Nhom7AsmGd1Application {

	public static void main(String[] args) {
		SpringApplication.run(Nhom7AsmGd1Application.class, args);
		Runtime rt = Runtime.getRuntime();
		  try {
	           rt.exec("cmd /c start msedge http://localhost:8080");
	      } catch (IOException e) {
	           e.printStackTrace();
	       }
	}

}
