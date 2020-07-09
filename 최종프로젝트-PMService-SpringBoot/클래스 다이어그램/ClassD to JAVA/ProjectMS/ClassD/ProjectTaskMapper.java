
import java.util.*;

/**
 * 
 */
public interface ProjectTaskMapper {

    /**
     * @param project_code 
     * @return
     */
    public List<TaskVO> selectTaskList(String project_code);

    /**
     * @param taskGroup 
     * @return
     */
    public void insertTaskGroup(TaskGroupDTO taskGroup);

    /**
     * @param taskGrooup_code 
     * @return
     */
    public void deleteTaskGroup(String taskGrooup_code);

    /**
     * @param task 
     * @return
     */
    public void insertTask(TaskDTO task);

    /**
     * @param task 
     * @return
     */
    public void updateTask(TaskDTO task);

    /**
     * @param task_code 
     * @return
     */
    public void deleteTask(String task_code);

}