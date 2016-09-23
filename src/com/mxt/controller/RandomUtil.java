package com.mxt.controller;

public class RandomUtil {
	
	public static String createRandomVcode(){
        //ÑéÖ¤Âë
        String vcode = "";
        for (int i = 0; i < 6; i++) {
            vcode = vcode + (int)(Math.random() * 9);
        }
        return vcode;
    }
}
