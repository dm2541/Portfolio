
import java.util.*;

/**
 * 
 */
public class TaskDTO {

    /**
     * Default constructor
     */
    public TaskDTO() {
    }

    /**
     * 
     */
    protected String task_code;

    /**
     * 
     */
    protected String task_name;

    /**
     * 
     */
    protected Date task_start;

    /**
     * 
     */
    protected Date task_finish;

    /**
     * 
     */
    protected String task_description;

    /**
     * 
     */
    protected String taskGroup_code;

    /**
     * 
     */
    protected String task_status_code;

    /**
     * 
     */
    private List<IssueVO> issues;

}