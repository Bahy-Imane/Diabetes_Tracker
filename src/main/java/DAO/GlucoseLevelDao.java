package DAO;

import Models.GlucoseLevel;

import java.util.List;

public interface GlucoseLevelDao {
    void addGlucoseLevel(GlucoseLevel glucoseLevel);
    void deleteGlucoseLevel(int glucoseLevelId);
    GlucoseLevel getGlucoseLevel(int glucoseLevelId);
    List<GlucoseLevel> getAllGlucoseLevels();
}
