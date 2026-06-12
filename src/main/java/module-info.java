module com.mycompany.almoxarifado {
    requires javafx.controls;
    requires javafx.fxml;
    
    // Declara o uso da biblioteca Ikonli (ícones)
    requires org.kordamp.ikonli.core;
    requires org.kordamp.ikonli.javafx;

    // Permite que o JavaFX injete o FXML nos pacotes App e Controller
    opens com.mycompany.almoxarifado to javafx.fxml;
    opens com.mycompany.almoxarifado.infra.javafx.Controller to javafx.fxml;

    exports com.mycompany.almoxarifado;
}