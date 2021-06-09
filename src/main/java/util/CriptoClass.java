/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.UnsupportedEncodingException;
import org.apache.tomcat.util.codec.binary.Base64;

public class CriptoClass {

    public static String encrypt(String password) throws UnsupportedEncodingException {
        byte[] encryptArray = Base64.encodeBase64(password.getBytes());
        return new String(encryptArray, "UTF-8");

    }

    public static String decrypt(String password) throws UnsupportedEncodingException {
        byte[] dectryptArray = password.getBytes();
        byte[] decarray = Base64.decodeBase64(dectryptArray);
        return new String(decarray, "UTF-8");

    }

//    public static void main(String[] args) throws UnsupportedEncodingException {
//        String password = "lploli22";
//        System.out.println("Parola pana la criptare este " + password);
//        String encriptedPass = CriptoClass.encrypt(password);
//        System.out.println("Parola criptata este " + encriptedPass);
//        String decriptedPass = CriptoClass.decrypt(encriptedPass);
//        System.out.println("Parola decriptata este " + decriptedPass);
//    }

}
