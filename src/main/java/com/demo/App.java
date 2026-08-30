package com.demo;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;//para usar o center

/*
   Aplicação desktop de exemplo (Swing) usada para demonstrar build de software desktop dentro de um container Docker.
   Este app NÃO precisa ser executado com interface gráfica real durante o build/CI. O container é usado apenas para compilar
   e empacotar o .jar — a execução com janela acontece na máquina final do usuário.
 */

public class App {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Demo Desktop - CI/CD com Docker");
        JLabel label = new JLabel("Build gerado dentro de um container Docker!", SwingConstants.CENTER);

        frame.add(label);
        frame.setSize(420, 150);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
