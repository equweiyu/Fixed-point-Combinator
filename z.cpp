auto z = [](auto &&f) {
    auto g = [&f](auto &&h) {
        return [&f, &h](auto &&x) { return f(h(h))(x); };
    };
    return g(g);
};