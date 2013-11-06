# Use so you can run in mock mode from the command line
#
# FOG_MOCK=true fog

if ENV["FOG_MOCK"] == "true"
  Fog.mock!
end

# if in mocked mode, fill in some fake credentials for us
if Fog.mock?
  Fog.credentials = {
    :aws_access_key_id                => 'aws_access_key_id',
    :aws_secret_access_key            => 'aws_secret_access_key',
    :ia_access_key_id                 => 'aws_access_key_id',
    :ia_secret_access_key             => 'aws_secret_access_key',
    :atmos_storage_token              => 'atmos_token',
    :atmos_storage_secret             => 'atmos_secret',
    :atmos_storage_endpoint           => 'http://atmos.is.cool:1000/test1.0',
    :bluebox_api_key                  => 'bluebox_api_key',
    :bluebox_customer_id              => 'bluebox_customer_id',
    :brightbox_client_id              => 'brightbox_client_id',
    :brightbox_secret                 => 'brightbox_secret',
    :cloudstack_disk_offering_id      => '',
    :cloudstack_host                  => 'http://cloudstack.example.org',
    :cloudstack_network_ids           => '',
    :cloudstack_service_offering_id   => '4437ac6c-9fe3-477a-57ec-60a5a45896a4',
    :cloudstack_template_id           => '8a31cf9c-f248-0588-256e-9dbf58785216',
    :cloudstack_zone_id               => 'c554c592-e09c-9df5-7688-4a32754a4305',
    :clodo_api_key                    => 'clodo_api_key',
    :clodo_username                   => 'clodo_username',
    :digitalocean_api_key             => 'digitalocean_api_key',
    :digitalocean_client_id           => 'digitalocean_client_id',
    :dnsimple_email                   => 'dnsimple_email',
    :dnsimple_password                => 'dnsimple_password',
    :dnsmadeeasy_api_key              => 'dnsmadeeasy_api_key',
    :dnsmadeeasy_secret_key           => 'dnsmadeeasy_secret_key',
    :ecloud_username                  => 'ecloud_username',
    :ecloud_password                  => 'ecloud_password',
    :ecloud_versions_uri              => 'http://ecloud.versions.uri',
    :glesys_username                  => 'glesys_username',
    :glesys_api_key                   => 'glesys_api_key',
    :go_grid_api_key                  => 'go_grid_api_key',
    :go_grid_shared_secret            => 'go_grid_shared_secret',
    :google_storage_access_key_id     => 'google_storage_access_key_id',
    :google_storage_secret_access_key => 'google_storage_secret_access_key',
    # Commented out till there are mocks for google/compute
    #:google_project                   => 'google_project_name',
    #:google_client_email              => 'fake@developer.gserviceaccount.com',
    #:google_key_location              => '~/fake.p12',
    :hp_access_key                    => 'hp_access_key',
    :hp_secret_key                    => 'hp_secret_key',
    :hp_tenant_id                     => 'hp_tenant_id',
    :hp_avl_zone                      => 'hp_avl_zone',
    :ibm_username                     => 'ibm_username',
    :ibm_password                     => 'ibm_password',
    :joyent_username                  => "joyentuser",
    :joyent_password                  => "joyentpass",
    :linode_api_key                   => 'linode_api_key',
    :local_root                       => '~/.fog',
    :bare_metal_cloud_password        => 'bare_metal_cloud_password',
    :bare_metal_cloud_username        => 'bare_metal_cloud_username',
    :ninefold_compute_key             => 'ninefold_compute_key',
    :ninefold_compute_secret          => 'ninefold_compute_secret',
    :ninefold_storage_secret          => 'ninefold_storage_secret',
    :ninefold_storage_token           => 'ninefold_storage_token',
#    :public_key_path                  => '~/.ssh/id_rsa.pub',
#    :private_key_path                 => '~/.ssh/id_rsa',
    :openstack_api_key                => 'openstack_api_key',
    :openstack_username               => 'openstack_username',
    :openstack_tenant                 => 'openstack_tenant',
    :openstack_auth_url               => 'http://openstack:35357/v2.0/tokens',
    :ovirt_url                        => 'http://ovirt:8080/api',
    :ovirt_username                   => 'admin@internal',
    :ovirt_password                   => '123123',
    :libvirt_uri                      => 'qemu://libvirt/system',
    :rackspace_api_key                => 'rackspace_api_key',
    :rackspace_username               => 'rackspace_username',
    :riakcs_access_key_id             => 'riakcs_access_key_id',
    :riakcs_secret_access_key         => 'riakcs_secret_access_key',
    :storm_on_demand_username         => 'storm_on_demand_username',
    :storm_on_demand_password         => 'storm_on_demand_password',
    :vcloud_host                      => 'vcloud_host',
    :vcloud_password                  => 'vcloud_password',
    :vcloud_username                  => 'vcloud_username',
    :voxel_api_key                    => 'voxel_api_key',
    :voxel_api_secret                 => 'voxel_api_secret',
    :zerigo_email                     => 'zerigo_email',
    :zerigo_token                     => 'zerigo_token',
    :dynect_customer                  => 'dynect_customer',
    :dynect_username                  => 'dynect_username',
    :dynect_password                  => 'dynect_password',
    :vsphere_server                   => 'virtualcenter.lan',
    :vsphere_username                 => 'apiuser',
    :vsphere_password                 => 'apipassword',
    :vsphere_expected_pubkey_hash     => 'abcdef1234567890',
    :libvirt_uri                      => 'qemu:///system',
    :libvirt_username                 => 'root',
    :libvirt_password                 => 'password',
    :cloudsigma_username              => 'csuname',
    :cloudsigma_password              => 'cspass'
  }.merge(Fog.credentials)
end
