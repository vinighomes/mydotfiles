/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package aula02;

/**
 *
 * @author darth06
 */
public class Aula02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println("");
        System.out.println("Modelo1");
        System.out.println("------------------");
        Caneta c1 = new Caneta();
        c1.modelo = "Bic";
        c1.carga = 75;
        c1.cor = "Azul";
        c1.ponta = 0.5f;
        c1.destampar(); 
        c1.rabiscar();
        c1.status();
        System.out.println("");
        System.out.println("Modelo2");
        System.out.println("------------------");
        Caneta c2 = new Caneta();
        c2.modelo = "Compactor";
        c2.carga = 99;
        c2.cor = "Vermelha";
        c2.ponta = 0.5f;
        c2.tampar();
        c2.rabiscar();
        c2.status();
        System.out.println("");
        System.out.println("Modelo3");
        System.out.println("------------------");
        Caneta c3 = new Caneta();
        c3.modelo = "Darth06";
        c3.carga = 66;
        c3.cor = "Vermelha";
        c3.ponta = 0.5f;
        c3.tampar();
        c3.rabiscar();
        c3.status();
        System.out.println("");
        System.out.println("Modelo4");
        System.out.println("------------------");
        Caneta c4 = new Caneta();
        c4.modelo = "Darth06";
        c4.carga = 55;
        c4.cor = "Verde";
        c4.ponta = 0.5f;
        c4.tampar();
        c4.rabiscar();
        c4.status();
    }
    
    
}
