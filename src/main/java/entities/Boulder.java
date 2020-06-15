package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Boulder extends Route implements Serializable {

    @Column(name = "sit_start")
    private boolean sitStart;

    public boolean isSitStart() {
        return sitStart;
    }

    public void setSitStart(boolean sitStart) {
        this.sitStart = sitStart;
    }


}
