package entities;

import java.util.HashMap;
import java.util.Map;

public enum Region {
    Auvergne("Auvergne-Rhône-Alpes") ,
    Bourgogne("Bourgogne-Franche-Comté"),
    Bretagne ("Bretagne") ,
    Centre("Centre-Val de Loire"),
    Corse("Corse") ,
    Grand_Est("Grand Est") ,
    Hauts_de_France("Hauts-de-France") ,
    Ile_de_France("Île-de-France") ,
    Normandie("Normandie") ,
    Nouvelle_Aquitaine("Nouvelle-Aquitaine") ,
    Occitanie("Occitanie") ,
    Pays_de_la_Loire("Pays de la Loire") ,
    Provence("Provence-Alpes-Côte d'Azur") ,
    DOM("DOM-TOM") ,
    Etranger ("Etranger");

    private final String region ;

    Region(String region){
        this.region = region;
    }

    public String getRegion() {
        return region;
    }

    private static final Map<String , String> mapRegions = new HashMap<>();

    static {
        for (Region r : values()) {
            mapRegions.put(r.region , r.name());
        }
    }

    public static Map<String, String> getMapRegions() {
        return mapRegions;
    }
}
