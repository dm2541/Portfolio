
import java.util.*;

/**
 * 
 */
public class ProjectDTO {

    /**
     * Default constructor
     */
    public ProjectDTO() {
    }

    /**
     * 
     */
    protected String project_code;

    /**
     * 
     */
    protected String project_name;

    /**
     * 
     */
    protected String project_subName;

    /**
     * 
     */
    protected Date project_start;

    /**
     * 
     */
    protected Date project_finish;

    /**
     * 
     */
    protected String project_pm;

    /**
     * 
     */
    protected String project_pmo;

    /**
     * 
     */
    protected String project_description;

    /**
     * 
     */
    protected int project_priority;

    /**
     * 
     */
    protected String project_statusCode;

    /**
     * 
     */
    protected String project_typeCode;

    /**
     * 
     */
    private List<ProjectMemberVO> project_members;

    /**
     * 
     */
    private List<SubManagerVO> project_subMgrs;

    /**
     * 
     */
    private List<TaskGroupVO> project_task_groups;

    /**
     * 
     */
    private List<OutputVO> project_outputs;

}