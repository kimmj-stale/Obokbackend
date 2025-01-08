package DOIT.TeamPJT3.Obok.Repository;

import DOIT.TeamPJT3.Obok.Entity.SourceTable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SourceRepository extends JpaRepository<SourceTable , Long> {

    @Query(value = "SELECT COUNT (*) FROM sourceTable" , nativeQuery = true)
    long countAll();

    @Query(value = "select count (s) from sourceTable s where s.data = :data")
    long countByData(@Param("data") String data);

    @Query("SELECT s.data , COUNT(s) AS frequency" + "FROM sourceTable s" + "GROUP BY s.data" + "ORDER BY frequenct DESC")
    Page<Object[]> findTopData(Pageable pageable);

    @Query("SELECT s.data , COUNT(s) AS frequency" + "FROM sourceTable s" + "GROUP BY s.data" + "ORDER BY frequency ASC")
    Page<Object[]> findLeastData(Pageable pageable);
}
