module com.mycompany.almoxarifado {
    requires javafx.controls;
    requires javafx.fxml;

    opens com.mycompany.almoxarifado to javafx.fxml;
    exports com.mycompany.almoxarifado;
}
