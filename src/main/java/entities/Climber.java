package entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity


public class Climber implements Serializable {

    @Id
    private String email;
    private String password;
    private String nickname;
    private boolean association;

    @OneToMany (mappedBy = "climber")
    private Set<Topo> topos;
    @OneToMany (mappedBy = "climber")
    private Set<Com> comments;

    public Set<Topo> getTopos() {
        return topos;
    }

    public void setTopos(Set<Topo> topos) {
        this.topos = topos;
    }

    public Set<Com> getComments() {
        return comments;
    }

    public void setComments(Set<Com> comments) {
        this.comments = comments;
    }


    public boolean isAssociation() {
        return association;
    }

    public void setAssociation(boolean association) {
        this.association = association;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
