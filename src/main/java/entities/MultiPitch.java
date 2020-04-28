package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@DiscriminatorValue("Grande voie")
public class MultiPitch extends Route implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int numberOfPitch;

    public int getNumberOfPitch() {
        return numberOfPitch;
    }

    public void setNumberOfPitch(int numberOfPitch) {
        this.numberOfPitch = numberOfPitch;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
