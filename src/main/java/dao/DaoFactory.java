package dao;

public class DaoFactory {
    public static Dao getMultipitchDao(){
        return new MultiPitchDao();
    }

    public static Dao getBoulderDao(){
        return new BoulderDao();
    }

    public static Dao getSinglePitchDao(){
        return new SinglePitchDao();
    }

    public static Dao getRouteDao(){
        return new RouteDao();
    }

    public static ClimberDao getUserDao(){
        return null;
    }

    public static ClimberDao getTopoDao(){
        return new TopoDao();
    }
}
