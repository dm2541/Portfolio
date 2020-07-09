
import java.util.*;

/**
 * 
 */
public interface ProjectService {

    /**
     * @return
     */
    public List<ProjectVO> getProjectListAll();

    /**
     * @param project 
     * @return
     */
    public int postProject(ProjectVO project);

    /**
     * @param project_id 
     * @return
     */
    public ProjectChartVO getProjectDetailChart(String project_id);

    /**
     * @param project_id 
     * @return
     */
    public ProjectDTO getProjectDetail(String project_id);

    /**
     * @param project_id 
     * @return
     */
    public int removeProject(String project_id);

    /**
     * @param project_id 
     * @return
     */
    public List<ProjectMemberVO> getProjectMember(String project_id);

    /**
     * @param project_id 
     * @return
     */
    public List<ProjectMemberChartVO> getProjectMemberChart(String project_id);

    /**
     * @param project_id 
     * @return
     */
    public List<IssueDTO> getProjectIssueList(String project_id);

    /**
     * @param issue_id 
     * @return
     */
    public int removeProjectIssue(String issue_id);

    /**
     * @param project_id 
     * @return
     */
    public List<OutputDTO> getProjectOutput(String project_id);

    /**
     * 
     */
    public void Operation1();

    /**
     * @param project_name 
     * @return
     */
    public List<ProjectDTO> getProjectListByName(String project_name);

    /**
     * @param project_typeCode 
     * @return
     */
    public List<ProjectDTO> getProjectListByType(String project_typeCode);

    /**
     * @param subManager 
     * @return
     */
    public int postProjectSubMgr(SubMangerDTO subManager);

    /**
     * @param project_id 
     * @return
     */
    public int removeProjectSubMgr(String project_id);

    /**
     * @param project_code 
     * @return
     */
    public List<SubManagerVO> getProjectSubMgr(String project_code);

    /**
     * @param project 
     * @return
     */
    public int putProject(ProjectDTO project);

    /**
     * @param project_id 
     * @return
     */
    public List<TaskVO> getProjectTaskList(String project_id);

}