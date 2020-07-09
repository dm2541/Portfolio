
import java.util.*;

/**
 * 
 */
public interface ProjectMapper {

    /**
     * @return
     */
    public List<ProjectVO> selectProjectListAll();

    /**
     * @param project_name 
     * @return
     */
    public List<ProjectVO> selectProjectListByName(String project_name);

    /**
     * @param project_typeCode 
     * @return
     */
    public List<ProjectVO> selectProjectListByType(String project_typeCode);

    /**
     * @param project_name 
     * @param project_typeCode 
     * @return
     */
    public List<ProjectVO> selectProjectListBySearch(String project_name, String project_typeCode);

    /**
     * @param project_code 
     * @return
     */
    public ProjectDTO selectProject(String project_code);

    /**
     * @param project 
     * @return
     */
    public void insertProject(ProjectVO project);

    /**
     * @param project_code 
     * @return
     */
    public void deleteProject(String project_code);

    /**
     * @param project 
     * @return
     */
    public void updateProject(ProjectVO project);

}