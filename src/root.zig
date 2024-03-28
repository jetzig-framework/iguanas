const std = @import("std");

pub fn iguanas(allocator: std.mem.Allocator, number_of_iguanas: usize) ![][]const u8 {
    var buf = std.ArrayList([]const u8).init(allocator);
    defer buf.deinit();

    for (0..number_of_iguanas) |_| try buf.append("iguana");
    return try allocator.dupe([]const u8, buf.items);
}

test "iguanas" {
    const five_iguanas = try iguanas(std.testing.allocator, 5);
    defer std.testing.allocator.free(five_iguanas);
    try std.testing.expectEqualSlices([]const u8, five_iguanas, &[_][]const u8{
        "iguana",
        "iguana",
        "iguana",
        "iguana",
        "iguana",
    });
}
