module calculator(
    input wire clk,           // 时钟信号
    input wire rst,           // 复位信号
    input wire add_sub_btn,   // 加法减法选择按钮
    input wire operand_btn,   // 被加数或被减数按钮
    input wire inc_btn,       // 减数按钮
    input wire dec_btn,       // 加数按钮
    output reg [6:0] result   // 7段数码管结果显示
);

reg [3:0] operation;          // 0表示加法，1表示减法
reg [3:0] operand;            // 操作数
reg [3:0] accumulator;        // 累加器

always @(posedge clk or posedge rst) begin
    if (rst) begin
        operation <= 4'b0;
        operand <= 4'b0;
        accumulator <= 4'b0;
        result <= 7'b0000000;
    end else begin
        // 根据按钮状态更新操作
        if (add_sub_btn) begin
            operation <= ~operation;
        end
        if (operand_btn) begin
            operand <= operand + (inc_btn - dec_btn);
        end
        // 执行加法或减法操作
        if (operation == 4'b0) begin
            accumulator <= accumulator + operand;
        end else begin
            accumulator <= accumulator - operand;
        end
        // 更新结果
        result <= accumulator;
    end
end

endmodule