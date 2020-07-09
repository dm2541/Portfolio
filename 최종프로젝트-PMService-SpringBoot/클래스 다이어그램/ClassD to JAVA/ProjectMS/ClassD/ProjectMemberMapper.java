
import java.util.*;

/**
 * 
 */
public interface ProjectMemberMapper {

    /**
     * @param project_code 
     * @return
     */
    public List<ProjectMemberVO> selectMemberListAll(String project_code);

    /**
     * @param projectMember 
     * @return
     */
    public void insertMember(ProjectMemberDTO projectMember);

    /**
     * @param project_joinCode 
     * @return
     */
    public void deleteMember(String project_joinCode);

    /**
     * @param project_code 
     * @return
     */
    public List<ProjectMemberChartVO> selectMemberChart(String project_code);

}