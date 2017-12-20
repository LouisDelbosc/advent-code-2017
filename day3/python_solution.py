from math import ceil, sqrt


def part_one(input):
    circle_index = get_circle_index(input)
    circle_zero = get_circle_zero(circle_index)
    cardinal_points = get_cardinal_points(circle_index, circle_zero)
    distance_to_closest_cardinal_point = compute_distance_to_closest_cardinal_point(input, cardinal_points)
    return circle_index + distance_to_closest_cardinal_point


def get_circle_index(input):
    return ceil(sqrt(input)) // 2


def get_circle_zero(circle_index):
    return pow(circle_index * 2 - 1, 2)


def get_cardinal_points(circle_index, circle_zero):
    return [circle_zero + x * circle_index for x in [1, 3, 5, 7]]


def compute_distance_to_closest_cardinal_point(input, cardinal_points):
    return min([abs(input - x) for x in cardinal_points])


def part_two(input):
    spiral = {}
    x = 0
    y = 0
    spiral[(0, 0)] = 1

    while spiral[(x, y)] < input:
        x, y = get_next_coordinates(x, y)
        coordinates_offsets = [-1, 0, 1]
        spiral[(x, y)] = sum([spiral.get((x + i, y + j), 0) for i in coordinates_offsets for j in coordinates_offsets])

    return spiral[(x, y)]


def get_next_coordinates(x, y):
    if x == y == 0:
        return (1, 0)
    if y > -x and x > y:
        return (x, y + 1)
    if y > -x and y >= x:
        return (x - 1, y)
    if y <= -x and x < y:
        return (x, y - 1)
    if y <= -x and x >= y:
        return (x + 1, y)


if __name__ == "__main__":
    input = 312051
    print(part_one(input))
    print(part_two(input))
