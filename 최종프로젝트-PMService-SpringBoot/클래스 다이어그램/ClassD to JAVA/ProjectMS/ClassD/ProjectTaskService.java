
import java.util.*;

/**
 * 
 */
public interface ProjectTaskService {

    /**
     * @param taskGroup 
     * @return
     */
    public int putTaskGroup(TaskGroupDTO taskGroup);

    /**
     * @param taskGroup_code 
     * @return
     */
    public int removeTaskGroup(String taskGroup_code);

    /**
     * @param taskGroup 
     * @return
     */
    public int postTaskGroup(TaskGroupDTO taskGroup);

    /**
     * @param task_code 
     * @return
     */
    public int removeProjectTask(String task_code);

    /**
     * @param task 
     * @return
     */
    public int postProjectTask(TaskDTO task);

    /**
     * @param output_code 
     * @return
     */
    public int removeProjectTaskFile(String output_code);

    /**
     * @param output 
     * @return
     */
    public int postProjectTaskFile(OutputDTO output);

}