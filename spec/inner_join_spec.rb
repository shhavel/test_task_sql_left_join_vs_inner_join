require "spec_helper"

##
# Write SQL query with INNER JOIN to select authors and corresponding books:
#
#     SELECT * FROM authors
#     ...
#     ORDER BY authors.id, books.id;
#
# NOTE: ORDER BY is added to guarantee the same sorting of results.
#       Without specified ORDER BY
#       SQL statement can return results in an unexpected order.

INNER_JOIN_QUERY = <<-SQL

SQL

describe "INNER JOIN" do
  it "returns only authors who have corresponding books" do
    expect(DB.execute(INNER_JOIN_QUERY)).to eq([
      [2, "Buddy Baker", 1, 2, "Morning Kyiv"],
      [2, "Buddy Baker", 2, 2, "How to assemble a bicycle"],
      [3, "Carlos Clark", 3, 3, "Cats & Dogs"]
    ])
  end
end
