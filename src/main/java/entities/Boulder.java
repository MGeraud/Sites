package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@DiscriminatorValue("Bloc")
public class Boulder extends Route implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private boolean sitStart;

    public boolean isSitStart() {
        return sitStart;
    }

    public void setSitStart(boolean sitStart) {
        this.sitStart = sitStart;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
