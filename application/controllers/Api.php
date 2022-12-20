<?php defined('BASEPATH') or exit('No direct script access allowed');

require_once APPPATH . 'libraries/API_Controller.php';

class Api extends API_Controller
{

    public function __construct()
    {
        parent::__construct();
        date_default_timezone_set('Asia/Jakarta');

        $this->load->database();
        $this->load->library(array('form_validation', 'session'));
        $this->load->helper(array('url', 'libs'));
    }

    //https://github.com/ctechhindi/CodeIgniter-API-Controller/blob/master/token.md
    public function login()
    {
        header("Access-Control-Allow-Origin: *");
        // API Configuration
        $this->_apiConfig([
            'methods' => ['POST'],
            // 'key'     => ['table'],
        ]);

        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('password', 'Password', 'required');

        if ($this->form_validation->run() == true) {

            $username = $this->input->post('username');
            $password = $this->input->post('password');

            $cek = $this->db->get_where('user', array('username' => $username, 'password' => sha1($password)));
            if ($cek->num_rows() > 0) {

                $user    = $cek->row_array();
                $payload = [
                    'user_id'     => $user['id'],
                    'user_level'  => $user['level'],
                    'user_bagian' => $user['bagian'],
                ];

                $this->load->library('Authorization_Token');
                $token = $this->authorization_token->generateToken($payload);

                $this->api_return(
                    [
                        'status'    => true,
                        "user"      => [
                            'user_id'    => $user['id'],
                            'user_name'  => $user['username'],
                            'user_level' => $user['level'],
                            'user_token' => $token,
                        ],
                        'error_msg' => '',
                    ],
                    200);

            } else {
                $this->api_return(
                    [
                        'status'    => false,
                        "error_msg" => 'Username dan atau Password tidak valid !',
                    ],
                    200);
            }

        } else {

            $this->api_return(
                [
                    'status'    => false,
                    "error_msg" => validation_errors(),
                ],
                200);

        }
    }

    public function get_satuan()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['GET'],
            'requireAuthorization' => true,
        ]);

        $qry = $this->db->get('satuan');

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "data berhasil diambil",
                "dataList"  => $qry->result(),

            ],
            200);
    }

    public function delete_cart()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];

        $this->db->where('user_id', $user_id);
        $this->db->delete('cart');

        $this->api_return(
            [
                'status'    => true,
                "error_msg" => "Keranjang berhasil dihapus",
            ],
            200);

    }

    public function delete_cart_item()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $cart_id = $this->input->post('cart_id');

        $this->db->where('id', $cart_id);
        $this->db->delete('cart');

        $this->api_return(
            [
                'status'    => true,
                "error_msg" => "data berhasil dihapus",
            ],
            200);
    }

    public function update_cart_item()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $cart_id = $this->input->post('cart_id');
        $qty     = $this->input->post('qty');

        if ($qty > 0) {
            $this->db->where('id', $cart_id);
            $this->db->update('cart', array('qty' => $qty));
        } else {
            $this->db->where('id', $cart_id);
            $this->db->delete('cart');
        }

        $this->api_return(
            [
                'status'    => true,
                "error_msg" => "data berhasil diupdate",
            ],
            200);
    }

    public function add_cart_item()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];

        $barang_id = $this->input->post('barang_id');
        $qty       = $this->input->post('qty');

        $cek = $this->db->get_where('cart', array('user_id' => $user_id, 'barang_id' => $barang_id));

        if ($cek->num_rows() > 0) {
            //tambahkan yang ada
            $cart = $cek->row_array();
            $qty  = $this->input->post('qty');

            //https://stackoverflow.com/a/48529591
            $this->db->set('qty', 'qty + ' . $qty, false)
                ->where('id', $cart['id'])
                ->update('cart');

            $this->api_return(
                [
                    'status'    => true,
                    "error_msg" => "item berhasil ditambahkan",
                ],
                200);

        } else {
            //insert
            $data = array('user_id' => $user_id, 'barang_id' => $barang_id, 'qty' => $qty);
            $this->db->insert('cart', $data);

            $this->api_return(
                [
                    'status'    => true,
                    "error_msg" => "item berhasil ditambahkan",
                ],
                200);
        }
    }

    public function save_barang()
    {

        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $user_id     = $user_data['token_data']["user_id"];
        $user_bagian = $user_data['token_data']["user_bagian"];

        $barang_id  = $this->input->post('barang_id');
        $foto       = $this->input->post('foto');
        $barcode    = $this->input->post('barcode');
        $nama       = $this->input->post('nama');
        $satuan_id  = $this->input->post('satuan_id');
        $harga_beli = $this->input->post('harga_beli');
        $harga_jual = $this->input->post('harga_jual');
        $stok_qty   = $this->input->post('stok_qty');
        $keterangan = $this->input->post('keterangan');

        if ($foto !== "NO_IMAGE") {

            $image = str_replace('data:image/png;base64,', '', $foto);
            $image = str_replace(' ', '+', $image);

            $imageName = generate_uuid() . '.png';
            file_put_contents('uploads/' . $imageName, base64_decode($image));
            $foto = $imageName;
        }

        if ($barang_id > 0) {
            //edit

            if ($foto !== "NO_IMAGE") {
                $barang = array(
                    'foto'       => $foto,
                    'barcode'    => $barcode,
                    'nama'       => $nama,
                    'satuan_id'  => $satuan_id,
                    'harga_beli' => $harga_beli,
                    'harga_jual' => $harga_jual,
                    'stok_qty'   => $stok_qty,
                    'keterangan' => $keterangan,
                );

                $this->db->where('id', $barang_id);
                $this->db->update('barang', $barang);

            } else {
                $barang = array(
                    'nama'       => $nama,
                    'barcode'    => $barcode,
                    'satuan_id'  => $satuan_id,
                    'harga_beli' => $harga_beli,
                    'harga_jual' => $harga_jual,
                    'stok_qty'   => $stok_qty,
                    'keterangan' => $keterangan,
                );

                $this->db->where('id', $barang_id);
                $this->db->update('barang', $barang);

            }

            $this->api_return(
                [
                    'status'    => true,
                    "error_msg" => "data berhasil diupdate",
                ],
                200);

        } else {

            $cek = $this->db->get_where('barang', array('nama' => $nama, 'satuan_id' => $satuan_id))->num_rows();

            if ($cek > 0) {

                $this->api_return(
                    [
                        'status'    => false,
                        "error_msg" => "Nama barang dengan satuan ini telah ada!\nBarang gagal disimpan",
                    ],
                    200);

            } else {

                if ($foto !== "NO_IMAGE") {
                    $barang = array(
                        'foto'       => $foto,
                        'barcode'    => $barcode,
                        'nama'       => $nama,
                        'satuan_id'  => $satuan_id,
                        'harga_beli' => $harga_beli,
                        'harga_jual' => $harga_jual,
                        'stok_qty'   => $stok_qty,
                        'keterangan' => $keterangan,
                        'bagian'     => $user_bagian,
                    );

                    $this->db->insert('barang', $barang);
                } else {
                    $barang = array(
                        'nama'       => $nama,
                        'barcode'    => $barcode,
                        'satuan_id'  => $satuan_id,
                        'harga_beli' => $harga_beli,
                        'harga_jual' => $harga_jual,
                        'stok_qty'   => $stok_qty,
                        'keterangan' => $keterangan,
                        'bagian'     => $user_bagian,
                    );

                    $this->db->insert('barang', $barang);

                }

                $this->api_return(
                    [
                        'status'    => true,
                        "error_msg" => "data berhasil disimpan",
                    ],
                    200);
            }

        }

    }

    public function delete_barang()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $barang_id = $this->input->post('barang_id');

        $this->db->where('id', $barang_id);
        $this->db->update('barang', array('terhapus' => 'Y'));

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "Data barang berhasil dihapus",
            ],
            200);

    }

    public function get_cart()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['GET'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];

        $this->db->select("a.id,
                           b.id AS barang_id,
                           b.nama AS nama_barang,
                           b.foto AS foto,
                           c.nama AS satuan,
                           b.harga_jual AS harga_jual,
                           b.harga_beli AS harga_beli,
                           a.qty");
        $this->db->join("barang b", "a.barang_id = b.id", "left");
        $this->db->join("satuan c", "b.satuan_id = c.id", "left");

        $qry = $this->db->get_where('cart a', array('user_id' => $user_id));

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "data berhasil diambil",
                "dataList"  => $qry->result(),

            ],
            200);

    }

    public function search_barang()
    {

        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $strCari     = $this->input->post('strCari');
        $exp_strCari = explode(' ', $strCari);

        $this->db->select('a.id,a.foto,a.barcode,TRIM(a.nama) AS nama,a.satuan_id,
                           b.nama AS satuan,a.harga_beli,a.harga_jual,
                           a.stok_qty,a.keterangan,a.bagian');

        $this->db->join('satuan b', 'a.satuan_id = b.id', 'left');

        $this->db->group_start();
        $this->db->like('a.barcode', $strCari, 'both');

        $this->db->or_group_start();
        foreach ($exp_strCari as $str) {
            $this->db->like('a.nama', $str, 'both');
        }
        $this->db->group_end();
        // $this->db->or_like('a.nama', $strCari, 'both');
        $this->db->or_like('a.keterangan', $strCari, 'both');
        $this->db->group_end();

        $this->db->where('a.terhapus', 'N');
        $this->db->order_by('a.nama', 'ASC');

        $qry = $this->db->get('barang a');

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "data berhasil diambil",
                "dataList"  => $qry->result(),

            ],
            200);

    }

    public function simpan_catatan()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $id  = $this->input->post('id');
        $isi = $this->input->post('isi');

        $this->db->where('id', $id);
        $this->db->update('catatan', array('isi' => $isi));

        $this->api_return(
            [
                'status'    => true,
                'error_msg' => 'Data catatan berhasil disimpan',
            ],
            200);

    }

    public function get_catatan()
    {

        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['GET'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];

        $this->db->limit(1);
        $this->db->order_by('id', 'desc');
        $cek = $this->db->get_where('catatan', array('user_id' => $user_id));

        if ($cek->num_rows() == 0) {
            $this->db->insert('catatan', array('user_id' => $user_id, 'tgl_buat' => date('Y-m-d H:i:s')));
        }

        $this->db->limit(1);
        $this->db->order_by('id', 'desc');
        $cek     = $this->db->get_where('catatan', array('user_id' => $user_id));
        $catatan = $cek->row_array();

        $this->api_return(
            [
                'status'    => true,
                "catatan"   => [
                    'id'  => $catatan['id'],
                    'isi' => $catatan['isi'],
                ],
                'error_msg' => '',
            ],
            200);

    }

    public function buat_catatan_baru()
    {

        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];
        $this->db->insert('catatan', array('user_id' => $user_id, 'tgl_buat' => date('Y-m-d H:i:s')));

        $this->db->limit(1);
        $this->db->order_by('id', 'desc');
        $cek     = $this->db->get_where('catatan', array('user_id' => $user_id));
        $catatan = $cek->row_array();

        $this->api_return(
            [
                'status'    => true,
                "catatan"   => [
                    'id'  => $catatan['id'],
                    'isi' => $catatan['isi'],
                ],
                'error_msg' => 'Catatan baru berhasil dibuat',
            ],
            200);

    }

    public function get_stok()
    {

        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['GET'],
            'requireAuthorization' => true,
        ]);

        $user_bagian = $user_data['token_data']["user_bagian"];

        $this->db->select("TRIM(a.nama) AS nama_barang,b.nama AS satuan,a.stok_qty AS qty");
        $this->db->join("satuan b", "a.satuan_id = b.id", "left");
        $this->db->order_by("a.stok_qty", "ASC");
        $this->db->order_by("TRIM(a.nama)", "ASC");
        $this->db->where('bagian', $user_bagian);
        $qry = $this->db->get('barang a');

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "data berhasil diambil",
                "dataList"  => $qry->result(),

            ],
            200);

    }

    public function get_transaction_list()
    {

        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['GET'],
            'requireAuthorization' => true,
        ]);

        $user_bagian = $user_data['token_data']["user_bagian"];

        $this->db->select("DATE(a.tgl) AS tgl, 
                            COUNT(a.id) AS jml_transaksi, 
                            SUM(b.harga_jual) AS total_harga_jual,
                            SUM(b.keuntungan) AS keuntungan");        
        
        $this->db->join("(SELECT penjualan_id,barang_id,
                                 SUM(harga_jual * qty) AS harga_jual,
                                 (SUM(harga_jual * qty) - SUM(harga_beli * qty)) AS keuntungan
                          FROM penjualan_detail
                          GROUP BY penjualan_id) b","a.id = b.penjualan_id","left");
        $this->db->join("barang c","b.barang_id = c.id","left");
            
        $this->db->group_by("DATE(a.tgl)");        
        $this->db->order_by("DATE(a.tgl)","DESC");
        $this->db->limit(30);
        $this->db->where("c.bagian",$user_bagian);
        $qry = $this->db->get('penjualan a');

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "data berhasil diambil",
                "dataList"  => $qry->result(),

            ],
            200);
    }


    public function get_hutang()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['GET'],
            'requireAuthorization' => true,
        ]);

        $this->db->select("id,DATE_FORMAT(tgl,'%d-%m-%Y %H:%i:%s') as tanggal,total_harga_jual,(total_harga_jual - bayar_tunai) as kurang_bayar,nama_pembeli");
        $this->db->where('bayar_tunai < total_harga_jual');
        $qry = $this->db->get('penjualan');

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "data berhasil diambil",
                "dataList"  => $qry->result(),

            ],
            200);

    }

    public function bayar_hutang()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $tgl_sekarang = date('Y-m-d H:i:s');
        $user_id      = $user_data['token_data']["user_id"];
        $penjualan_id = $this->input->post('penjualan_id');
        $bayar_tunai  = $this->input->post('bayar_tunai');

        //https://stackoverflow.com/a/48529591
        $this->db->set('bayar_tunai', 'bayar_tunai + ' . $bayar_tunai, false)
            ->where('id', $penjualan_id)
            ->update('penjualan');

        //insert log
        $this->db->insert('penjualan_log_bayar',
            array(
                'tgl'             => $tgl_sekarang,
                'penjualan_id'    => $penjualan_id,
                'bayar_tunai'     => $bayar_tunai,
                'created_user_id' => $user_id,
            )
        );

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "Transaksi berhasil disimpan",

            ], 200);

    }




    public function save_transaction()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];

        //tgl,total_harga_jual,bayar_tunai,nama_pembeli,created_user
        $tgl_sekarang     = date('Y-m-d H:i:s');
        $bayar_tunai      = $this->input->post('bayar_tunai');
        $nama_pembeli     = $this->input->post('nama_pembeli');
        $total_harga_jual = $this->input->post('total_harga_jual');
        $total_harga_beli = $this->input->post('total_harga_beli');

        //insert header
        $this->db->insert('penjualan',
            array(
                'tgl'              => $tgl_sekarang,
                'total_harga_jual' => $total_harga_jual,
                'total_harga_beli' => $total_harga_beli,
                'bayar_tunai'      => $bayar_tunai,
                'nama_pembeli'     => $nama_pembeli,
                'created_user_id'  => $user_id,
            )
        );

        $penjualan_id = $this->db->insert_id();

        $this->db->select('a.barang_id,a.qty,b.harga_beli,b.harga_jual');
        $this->db->join('barang b', 'a.barang_id = b.id', 'left');
        $this->db->where('a.user_id', $user_id);
        $cart = $this->db->get('cart a');

        foreach ($cart->result() as $c) {

            $this->db->insert('penjualan_detail',
                array(
                    'penjualan_id' => $penjualan_id,
                    'barang_id'    => $c->barang_id,
                    'qty'          => $c->qty,
                    'harga_beli'   => $c->harga_beli,
                    'harga_jual'   => $c->harga_jual,
                )
            );

            //update stok
            //https://stackoverflow.com/a/48529591
            $this->db->set('stok_qty', 'stok_qty - ' . $c->qty, false)
                ->where('id', $c->barang_id)
                ->update('barang');
        }

        //insert log
        $this->db->insert('penjualan_log_bayar',
            array(
                'tgl'             => $tgl_sekarang,
                'penjualan_id'    => $penjualan_id,
                'bayar_tunai'     => $bayar_tunai,
                'created_user_id' => $user_id,
            )
        );

        //hapus cart
        $this->db->where('user_id', $user_id);
        $this->db->delete('cart');

        $this->api_return(
            [
                "status"    => true,
                "error_msg" => "Transaksi berhasil disimpan",

            ], 200);

    }

    public function save_firebase_token()
    {
        header("Access-Control-Allow-Origin: *");
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        $user_id = $user_data['token_data']["user_id"];

        $this->db->where('id', $user_id);
        $this->db->update('user', array('firebase_token' => $this->input->post('token_id')));

        $this->api_return(
            [
                'status'    => true,
                "error_msg" => "token berhasil disimpan",
            ],
            200);
    }

    public function view()
    {
        header("Access-Control-Allow-Origin: *");

        // API Configuration [Return Array: User Token Data]
        $user_data = $this->_apiConfig([
            'methods'              => ['POST'],
            'requireAuthorization' => true,
        ]);

        //echo $user_data['token_data']["user_level"];

        // return data
        $this->api_return(
            [
                'status' => true,
                "result" => [
                    'user_data' => $user_data['token_data'],
                ],
            ],
            200);
    }

}
