#pragma once

#include <cstdint>
#include <vector>
#include <set>

using VectorOfU32 = std::vector<uint32_t>;
using SetOfU32 = std::set<uint32_t>;

static inline VectorOfU32 vec;
static inline SetOfU32 set;

inline void initVector(size_t size) {
    if (!vec.empty()) {
        return;
    }
    vec.reserve(size);
    for (size_t i = 0; i < size; ++i) {
        vec.push_back(uint32_t(i));
    }
}

inline void initSet(size_t size) {
    if (!set.empty()) {
        return;
    }
    for (size_t i = 0; i < size; ++i) {
        set.insert(uint32_t(i));
    }
}

inline VectorOfU32 makeVector32(size_t size) {
    initVector(size);
    return vec;
}

inline SetOfU32 makeSet32(size_t size) {
    initSet(size);
    return set;
}

inline uint32_t testVector32Sum(size_t vectorSize, size_t iters) {
    auto vector = makeVector32(vectorSize);
    auto sum = uint32_t(0);
    for (size_t i = 0; i < iters; ++i) {
        for (auto x : vector) {
            sum += x;
        }
    }
    return sum;
}

// FIXME: remove when the templated operator == is correctly bridged.
inline bool operator ==(const VectorOfU32::const_iterator &lhs, const VectorOfU32::const_iterator &rhs) { return lhs.base() == rhs.base(); }
inline bool operator ==(const SetOfU32::const_iterator &lhs, const SetOfU32::const_iterator &rhs) { return lhs.operator->() == rhs.operator->(); }
