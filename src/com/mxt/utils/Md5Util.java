package com.mxt.utils;

import java.security.MessageDigest;

public class Md5Util {
	/**
	 * 鎶婂瓧鑺傛暟缁勮浆鎹㈡垚16杩涘埗鏁�
	 * @param bytes
	 * @return
	 */
	public static String bytesToHex(byte[] bytes) {
		StringBuffer md5str = new StringBuffer();
		// 鎶婃暟缁勬瘡涓�瓧鑺傛崲鎴�6杩涘埗杩炴垚md5瀛楃涓�
		int digital;
		for (int i = 0; i < bytes.length; i++) {
			digital = bytes[i];
			if (digital < 0) {
				digital += 256;
			}
			if (digital < 16) {
				md5str.append("0");
			}
			md5str.append(Integer.toHexString(digital));
		}
		return md5str.toString().toUpperCase();
	}

	public static String bytesToMD5(byte[] input) {
		String md5str = null;
		try {
			// 鍒涘缓涓�釜鎻愪緵淇℃伅鎽樿绠楁硶鐨勫璞★紝鍒濆鍖栦负md5绠楁硶瀵硅薄
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 璁＄畻鍚庤幏寰楀瓧鑺傛暟缁�
			byte[] buff = md.digest(input);
			// 鎶婃暟缁勬瘡涓�瓧鑺傛崲鎴�6杩涘埗杩炴垚md5瀛楃涓�
			md5str = bytesToHex(buff);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return md5str;
	}

	public static String strToMD5(String str) {
		byte[] input = str.getBytes();
		return bytesToMD5(input);
	}

}
