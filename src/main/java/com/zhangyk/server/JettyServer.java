package com.zhangyk.server;


import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.xml.XmlConfiguration;

import java.io.FileInputStream;

public class JettyServer {

    public static void main(String[] args) {
        try {
            XmlConfiguration config = new XmlConfiguration(new FileInputStream("src/main/resources/jetty/jetty.xml"));
            Server server = new Server();
            config.configure(server);
            server.start();
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

}