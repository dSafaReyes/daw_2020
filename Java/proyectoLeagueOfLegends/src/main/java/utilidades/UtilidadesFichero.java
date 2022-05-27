package utilidades;

import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import modelos.*;

import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class UtilidadesFichero {

    public static List<Personaje> leerPersonajes() throws IOException {
        CSVReader reader = null;
        List<Personaje> personajes = null;
        try {
            reader = new CSVReaderBuilder(new FileReader("documentos/personajes.csv")).withSkipLines(1).build();
            personajes = reader.readAll().stream().map(
                    row -> {
                        Personaje personaje = new Personaje();
                        personaje.setId(Integer.parseInt(row[0]));
                        personaje.setNombre(row[1]);
                        personaje.setFechaCreacion(LocalDate.parse(row[2], DateTimeFormatter.ofPattern("d/MM/yyyy")));
                        personaje.setNivel(1);
                        personaje.setAtaqueBase(Double.parseDouble(row[3]));
                        personaje.setDefensaBase(Double.parseDouble(row[4]));
                        personaje.setVidaBase(Double.parseDouble(row[5]));
                        personaje.setManaBase(Double.parseDouble(row[6]));
                        personaje.setRegion(Region.valueOf(row[7]));
                        return personaje;
                    }
            ).toList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                reader.close();
            }
        }
        return personajes;
    }

    public static List<Habilidad> leerHabilidades() throws IOException {
        CSVReader reader = null;
        List<Habilidad> habilidades = null;
        try {
            reader = new CSVReaderBuilder(new FileReader("documentos/habilidades.csv")).withSkipLines(1).build();
            habilidades = reader.readAll().stream().map(
                    row -> {
                        Habilidad habilidad = new Habilidad();
                        habilidad.setId(Integer.parseInt(row[1]));
                        habilidad.setNombre(row[2]);
                        habilidad.setDanioBase(Double.valueOf(row[3]));
                        habilidad.setCosteMana(Double.valueOf(row[4]));
                        habilidad.setTipoHabilidad(TipoHabilidad.valueOf(row[5]));
                        return habilidad;
                    }
            ).toList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                reader.close();
            }
        }
        return habilidades;
    }

    public static List<Item> leerItems() throws IOException {
        CSVReader reader = null;
        List<Item> items = null;
        try {
            reader = new CSVReaderBuilder(new FileReader("documentos/habilidades.csv")).withSkipLines(1).build();
            items = reader.readAll().stream().map(
                    row -> {
                        Item item = new Item();
                        item.setId(Integer.parseInt(row[0]));
                        item.setNombre(row[1]);
                        item.setAumentoDanio(Double.valueOf(row[2]));
                        item.setAumentoDefensa(Double.valueOf(row[3]));
                        item.setAumentoSalud(Double.valueOf(row[4]));
                        item.setAumentoMana(Double.valueOf(row[5]));
                        return item;
                    }
            ).toList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != reader) {
                reader.close();
            }
        }
        return items;
    }

    public static void main(String[] args) throws IOException {
        leerPersonajes().forEach(System.out::println);
        leerHabilidades().forEach(System.out::println);
    }

}
