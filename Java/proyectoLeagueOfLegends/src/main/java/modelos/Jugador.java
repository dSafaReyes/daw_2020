package modelos;

import java.util.Map;
import java.util.Set;

public class Jugador {
    private int id;
    private String nickname;
    private Set<Personaje> personajesFavoritos;
    private Map<Personaje, Integer> partidasGanadas;
}
