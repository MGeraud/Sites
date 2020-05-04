package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@DiscriminatorValue("Grande voie")
public class MultiPitch extends Route implements Serializable {


    private int numberOfPitch;

    public int getNumberOfPitch() {
        return numberOfPitch;
    }

    public void setNumberOfPitch(int numberOfPitch) {
        this.numberOfPitch = numberOfPitch;
    }


}
