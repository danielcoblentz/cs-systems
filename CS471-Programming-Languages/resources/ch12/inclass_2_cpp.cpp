#include <iostream>
#include <string>
#include <vector>

class TodoItem {
public:
    TodoItem(std::string description, bool done = false)
        : description_(std::move(description)), done_(done) {}

    void mark_done() { done_ = true; }
    bool is_done() const { return done_; }

    const std::string& description() const { return description_; }

private:
    std::string description_;
    bool done_;
};

class TodoList {
public:
    void add(std::string item) { items_.emplace_back(std::move(item)); }

    void complete(std::size_t index) {
        if (index < items_.size()) {
            items_[index].mark_done();
        }
    }

    void print() const {
        for (std::size_t i = 0; i < items_.size(); ++i) {
            const auto& item = items_[i];
            std::cout << (item.is_done() ? "[x] " : "[ ] ")
                      << i + 1 << ". " << item.description() << '\n';
        }
    }

private:
    std::vector<TodoItem> items_;
};

int main() {
    TodoList list;
    list.add("Review C++ class design");
    list.add("Compile and run the example");
    list.add("Share notes with the team");

    list.complete(1);

    list.print();
    return 0;
}
