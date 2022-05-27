import javax.swing.*;
import java.awt.*;

public class App extends JFrame {

    //GapStyle
    public Container panel;
    public JButton miBoton;

    public App() {
        super("Ventana Principal");
        miBoton = new JButton("Aceptar");
        panel = getContentPane();
        panel.add(miBoton);
        setSize(200, 100);
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {

        App aplicacion = new App();

    }

}
