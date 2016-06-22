using Iterators

function outer(f, vals...)
    shape = map(length, vals)
    out = Array{Any}(prod(shape)) # can I do better than Any
    for (idx, val) in enumerate(product(vals...))
        out[idx] = f(val...)
    end
    reshape(out, shape)
end

@show outer((x, y, z)->[x, y, z], [1, 2, 3], [4, 5, 6], [7, 8, 9])

# Outer[StringJoin, {"", "re", "un"}, {"cover", "draw", "wind"}, {"", "ing", "s"}]
@show outer(string, ["", "re", "un"], ["cover", "draw", "wind"], ["", "ing", "s"])

#TODO: so I have some column major issues due to how `product` iterates. I need to think
# about what this means for how I should input things
