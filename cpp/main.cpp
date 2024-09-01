#include "bindings.h"
#include "google/cloud/spanner/client.h"
#include <iostream>

int main(int argc, char* argv[]) {
  if (argc != 4) {
    std::cerr << "Usage: " << argv[0]
              << " project-id instance-id database-id\n";
    return 1;
  }

  namespace spanner = ::google::cloud::spanner;
  spanner::Client client(spanner::MakeConnection(spanner::Database(argv[1], argv[2], argv[3])));
  auto rows = client.ExecuteQuery(spanner::SqlStatement("SELECT 'Hello World'"));
  for (auto const& row : spanner::StreamOf<std::tuple<std::string>>(rows)) {
    if (!row) {
      std::cerr << row.status() << "\n";
      return 1;
    }

    std::cout << std::get<0>(*row) << "\n";
  }

  return 0;
}
