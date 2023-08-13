// Code for list of student in classid
<?php
include('includes/config.php');
if (!empty($_POST["class"])) {
  $cid = intval($_POST['class']);
  $stmt = $dbh->prepare("SELECT tblstudent.StudentName, tblstudent.StudentID , tblresult.ClassID
                        FROM tblstudent INNER join tblresult 
                        ON tblstudent.StudentID=tblresult.studentid 
                        WHERE tblresult.ClassID = :cid
                        order by StudentID;");
  $stmt->execute(array(':cid' => $cid));
  ?>
  <option value="">Select Student </option>
    <?php
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    ?>
  <option value = "<?php echo htmlentities($row['StudentID']); ?>">
    <?php echo htmlentities($row['StudentID']) ." - ". htmlentities($row['StudentName']); ?></option>
    <?php
  }
}?>

<?php
if (!empty($_POST["studclass"])) {
  $id = $_POST['studclass'];
  $dta = explode("$", $id);
  $id = $dta[0];
  $id1 = $dta[1];
  $query = $dbh->prepare("SELECT StudentId,ClassId FROM tblresult WHERE StudentId=:id1 and ClassId=:id ");
  //$query= $dbh -> prepare($sql);
  $query->bindParam(':id1', $id1, PDO::PARAM_STR);
  $query->bindParam(':id', $id, PDO::PARAM_STR);
  $query->execute();
  $results = $query->fetchAll(PDO::FETCH_OBJ);
  $cnt = 1;
  if ($query->rowCount() > 0) { ?>
    <p>
      <?php
      echo "<span style='color:red'> Result Already Declare .</span>";
      echo "<script>$('#submit').prop('disabled',true);</script>";
      ?>
    </p>
  <?php }
} ?>