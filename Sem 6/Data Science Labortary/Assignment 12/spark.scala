// Import required library
import org.apache.spark.sql.SparkSession

// Create Spark Session
val spark = SparkSession.builder()
  .appName("Student Data Example")
  .master("local[*]")
  .getOrCreate()

import spark.implicits._

// Create sample data (id, name, marks)
val data = Seq(
  (1, "Amit", 85),
  (2, "Rahul", 78),
  (3, "Sneha", 92),
  (4, "Priya", 88)
)

// Convert to DataFrame
val df = data.toDF("ID", "Name", "Marks")

// Show Data
df.show()

// Basic Operations
println("Total Students: " + df.count())

// Filter students with marks > 80
val topStudents = df.filter($"Marks" > 80)
topStudents.show()

// Average Marks
df.selectExpr("avg(Marks)").show()

// Stop Spark
spark.stop()