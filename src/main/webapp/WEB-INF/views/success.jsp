<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <title>Thanh toán thành công</title>
</head>

<body>
<!-- back to top -->

<!-- start body -->
<body>
    <div style="background-color: #f5f5f5; display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div style="max-width: 500px; padding: 20px; background-color: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
            <h1 style="font-size: 24px; color: #28a745; text-align: center; margin-top: 20px;">Thanh toán thành công</h1>
            <h2 style="font-size: 20px; margin-top: 10px;">Chi tiết đơn hàng</h2>
            <table style="border-collapse: collapse; width: 100%;">
                <tbody>
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 8px;">Thông tin đơn hàng:</td>
                        <td style="border: 1px solid #ddd; padding: 8px;"><span th:text="${orderId}">[order ID]</span></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 8px;">Tổng tiền:</td>
                        <td style="border: 1px solid #ddd; padding: 8px;"><span th:text="${totalPrice}">[total price]</span></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 8px;">Thời gian thanh toán:</td>
                        <td style="border: 1px solid #ddd; padding: 8px;"><span th:text="${paymentTime}">[payment time]</span></td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #ddd; padding: 8px;">Mã giao dịch:</td>
                        <td style="border: 1px solid #ddd; padding: 8px;"><span th:text="${transactionId}">[transaction ID]</span></td>
                    </tr>
                </tbody>
            </table>
            <a href="/" style="display: block; text-align: center; margin-top: 20px;" class="btn btn-primary">Về trang chủ</a>
        </div>
    </div>
</body>
<!-- end body -->


<!-- start footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>