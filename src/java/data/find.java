/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.*;
import java.util.*;
/**
 *
 */
public class find {
     public static void main( String[] args ) throws IOException {
    BufferedReader br=new BufferedReader(new FileReader("C:\\Users\\prsm\\Desktop\\find.txt"));
    
String currentLine;

while((currentLine = br.readLine()) != null)
{
    if(currentLine.equalsIgnoreCase("fuck"))
    {
        System.out.println("existed");
        break;
    }
    else
    {
        System.out.println("welcome");
    }
}
}
    
}
