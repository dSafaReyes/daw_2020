package modelos;

import java.time.LocalDate;
import java.util.*;

public class Partida {

    private int id;
    private String codigo;
    private Double server;
    private Map<Jugador, Personaje> elecciones;
    private Map<Integer, Set<Jugador>> jugadoresPorEquipo;
    private LocalDate inicioPartida;
    private LocalDate finPartida;
    private int duracionPartida;
    private Integer equipoVencedor;

}
