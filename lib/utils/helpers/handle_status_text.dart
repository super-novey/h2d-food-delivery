String getDriverStatusText(String? status) {
  const statusMapping = {
    'new': 'Đang đến quán',
    'in_progress': 'Đang giao hàng',
    'completed': 'Đã hoàn thành',
    'cancelled': 'Đã hủy',
  };

  return statusMapping[status] ?? 'Trạng thái không xác định';
}
