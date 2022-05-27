package utilidades;

import modelos.Personaje;
import modelos.Region;

import java.util.*;
import java.util.stream.Collectors;

public class UtilidadesPersonaje {

    public static Personaje levelUp(Personaje personaje) {
        Integer nuevoNivel = personaje.getNivel() + 1;
        Double nuevoAtaque = personaje.getAtaqueBase() + personaje.getEscabilidad().getIncrementoDanioNivel()*nuevoNivel;
        Double nuevaDefens = personaje.getDefensaBase() + personaje.getEscabilidad().getIncrementoDefensaNivel()*nuevoNivel;
        Double nuevaVida = personaje.getVidaBase() + personaje.getEscabilidad().getIncrementoSaludNivel()*nuevoNivel;
        Double nuevoMana = personaje.getManaBase() + personaje.getEscabilidad().getIncrementoManaNivel()*nuevoNivel;
        personaje.setNivel(nuevoNivel);
        personaje.setAtaque(nuevoAtaque);
        personaje.setDefensa(nuevaDefens);
        personaje.setVida(nuevaVida);
        personaje.setMana(nuevoMana);
        return personaje;
}

    public static Double getStatsToCompare(Personaje personaje) {
        Integer nuevoNivel = 18;
        Double maxAtaque = personaje.getAtaqueBase() + personaje.getEscabilidad().getIncrementoDanioNivel()*18;
        Double maxDefensa = personaje.getDefensaBase() + personaje.getEscabilidad().getIncrementoDefensaNivel()*18;
        Double maxVida = personaje.getVidaBase() + personaje.getEscabilidad().getIncrementoSaludNivel()*18;
        Double maxMana = personaje.getManaBase() + personaje.getEscabilidad().getIncrementoManaNivel()*18;
        personaje.setNivel(nuevoNivel);
        personaje.setAtaque(maxAtaque);
        personaje.setDefensa(maxDefensa);
        personaje.setVida(maxVida);
        personaje.setMana(maxMana);
        return maxAtaque + maxDefensa + maxVida + maxMana;
    }

    public static Map<Region, List<Personaje>> getPersonajesPorRegion(List<Personaje> personajes) {
        return personajes.stream().collect(Collectors.groupingBy(Personaje::getRegion));
    }

    public static Personaje getMasPoderoso(List<Personaje> personajes) {
        return personajes.stream().max(Comparator.comparing(UtilidadesPersonaje::getStatsToCompare)).orElseThrow(NoSuchElementException::new);
    }

    public static Map<Region, Personaje> getMasPoderosoPorRegion(List<Personaje> personajes) {
//        return getPersonajesPorRegion(personajes).replaceAll((region, personajes1) -> personajes1 = new Personaje(getMasPoderoso(personajes1))));
//        return getPersonajesPorRegion(personajes).values().stream().map(UtilidadesPersonaje::getMasPoderoso);
//        return getPersonajesPorRegion(personajes).values(personajes.stream().map(UtilidadesPersonaje::getMasPoderoso));
        return null;
    }
    public static void main(String[] args) {
        Map<String, List<Integer>> map = new HashMap<>();
        map.put("A", Arrays.asList(1, 2, 4, 5));
        map.put("B", Arrays.asList(2, 5, 8, 5));
        map.put("C", Arrays.asList(3, 9, 2, 5));
        System.out.println(map);
        map.replaceAll((k, v) -> v = Arrays.asList(0, 0, 0, 0));
        System.out.println(map);
    }
}
