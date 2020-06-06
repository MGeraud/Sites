package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Boulder extends Route implements Serializable {

    private boolean sitStart;

    public boolean isSitStart() {
        return sitStart;
    }

    public void setSitStart(boolean sitStart) {
        this.sitStart = sitStart;
    }


}
