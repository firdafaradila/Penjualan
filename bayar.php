<div class="row">
<?php 
	$kd = $_GET['kdpembelian'];
	$tam = $nota->ambil_nota_pembelian($kd);

	if (isset($_POST['upload'])) {
		$upload = $nota->upload_pembayaran($kd, $_FILES['gambar']);
		if ($upload) {
			header('location: index.php?page=pembelian&id='.$_SESSION['login_admin']['id']);
		} else {
			header('location: index.php');
		}
	}
?>
	<div class="col-md-12">
		<table class="table table-bordered table-responsive table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>Nama Barang</th>
					<th>Satuan</th>
					<th>Harga</th>
					<th>Jumlah</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<?php  
					$br = $nota->tampil_nota_pembelian($kd);
					foreach ($br as $index => $data) {
				?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $data['nama_barang_beli']; ?></td>
					<td><?php echo $data['satuan']; ?></td>
					<td>Rp. <?php echo number_format($data['harga_beli']);?></td>
					<td><?php echo $data['item']; ?></td>
					<td>Rp. <?php echo number_format($data['total']); ?></td>
				</tr>
				<?php } ?>
				<tr class="active">
					<td colspan="5" align="center"><strong>Subtotal</strong></td>
					<td colspan="2"><?php echo number_format($tam['total_pembelian']); ?></td>
				</tr>
			</tbody>
		</table>
	</div>
		<div class="col-md-12">
		<form method="POST" id="forminput" enctype="multipart/form-data">
		<div class="form-group">
			<label>Bukti Pembayaran</label>
			<input type="file" class="form-control" name="gambar" id="formgambar">
		</div>	
		<div class="panel-footer" align="center">
			<button id="formbtn" class="btn btn-primary" name="upload"><i class="fa fa-upload"></i> Upload</button>
		</div>				
		</form><!--End Form-->
	</div>

</div>