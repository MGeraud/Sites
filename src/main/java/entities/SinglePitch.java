package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@DiscriminatorValue("Voie")
public class SinglePitch extends Route implements Serializable {

    private int spit;
    private int routeLength;


    public int getRouteLength() {
        return routeLength;
    }

    public void setRouteLength(int routeLength) {
        this.routeLength = routeLength;
    }

    public int getSpit() {
        return spit;
    }

    public void setSpit(int spit) {
        this.spit = spit;
    }

}
