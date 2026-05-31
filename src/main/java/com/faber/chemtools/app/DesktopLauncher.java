package com.faber.chemtools.app;

import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.web.server.context.WebServerApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Profile;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;


@Component
@Profile("desktop")
public class DesktopLauncher {

    private final ConfigurableApplicationContext context;

    public DesktopLauncher(ConfigurableApplicationContext context) {
        this.context = context;
    }


    @EventListener(ApplicationReadyEvent.class)
    public void onReady() {
        Platform.startup(() -> {
            Stage stage = new Stage();

            int port = ((WebServerApplicationContext) context)
                    .getWebServer()
                    .getPort();


            WebView webView = new WebView();
            webView.getEngine().load("http://localhost:"+port+"/");

            stage.setScene(new Scene(webView, 1200, 900));

            stage.setOnCloseRequest(event -> {
                context.close();
                Platform.exit();
                System.exit(0);
            });

            stage.show();
        });
    }
}
