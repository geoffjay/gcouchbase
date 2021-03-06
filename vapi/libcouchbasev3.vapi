/* 
  Copyright (C) 2013-2016, Nicholas Melnick

  Permission is hereby granted, free of charge, to any person obtaining a copy of
  this software and associated documentation files (the "Software"), to deal in
  the Software without restriction, including without limitation the rights to
  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
  of the Software, and to permit persons to whom the Software is furnished to do
  so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

[CCode (lower_case_cprefix = "lcb_", cheader_filename = "libcouchbase/couchbase.h")]
namespace LibCouchbase {

    /**
     * Define the error codes in use by the library
     */
	[SimpleType]
	[CCode (cname = "lcb_error_t", cprefix = "LCB_", has_type_id = false)]
	public enum StatusResponse {
		/**
		 * Indication of success
		 */
		SUCCESS,
		/**
		 * This error code is only used internally within libcouchbase
		 * to represent a state in the network protocol
		 */
		AUTH_CONTINUE,
		/**
		 * Authentication failed.
		 * You provided an invalid username/password combination.
		 */
		AUTH_ERROR,
		/**
		 * The server detected that operation cannot be executed with
		 * requested arguments. For example, when incrementing not a number.
		 */
		DELTA_BADVAL,
		/**
		 * The server reported that this object is too big
		 */
		E2BIG,
		/**
		 * The server is too busy to handle your request right now.
		 * please back off and try again at a later time.
		 */
		EBUSY,
		/**
		 * Internal error inside the library. You would have
		 * to destroy the instance and create a new one to recover.
		 */
		EINTERNAL,
		/**
		 * Invalid arguments specified.
		 */
		EINVAL,
		/**
		 * The server is out of memory
		 */
		ENOMEM,
		/**
		 * An invalid range specified
		 */
		ERANGE,
		/**
		 * A generic error code.
		 */
		ERROR,
		/**
		 * The server tried to perform the requested operation, but failed
		 * due to a temporary constraint. Retrying the operation may work.
		 */
		ETMPFAIL,
		/**
		 * The key already exists (with another CAS value)
		 */
		KEY_EEXISTS,
		/**
		 * The key does not exists
		 */
		KEY_ENOENT,
		/**
		 * Failed to open shared object
		 */
		DLOPEN_FAILED,
		/**
		 * Failed to locate the requested symbol in the shared object
		 */
		DLSYM_FAILED,
		/**
		 * A network related problem occured (name lookup, read/write/connect
		 * etc)
		 */
		NETWORK_ERROR,
		/**
		 * The server who received the request is not responsible for the
		 * object anymore. (This happens during changes in the cluster
		 * topology)
		 */
		NOT_MY_VBUCKET,
		/**
		 * The object was not stored on the server
		 */
		NOT_STORED,
		/**
		 * The server doesn't support the requested command. This
		 * error code differs from LCB_UNKNOWN_COMMAND by that the server
		 * knows about the command, but for some reason decided to not
		 * support it.
		 */
		NOT_SUPPORTED,
		/**
		 * The server doesn't know what that command is.
		 */
		UNKNOWN_COMMAND,
		/**
		 * The server failed to resolve the requested hostname
		 */
		UNKNOWN_HOST,
		/**
		 * There is something wrong with the datastream received from
		 * the server
		 */
		PROTOCOL_ERROR,
		/**
		 * The operation timed out
		 */
		ETIMEDOUT,
		/**
		 * Failed to connect to the requested server
		 */
		CONNECT_ERROR,
		/**
		 * The requested bucket does not exist
		 */
		BUCKET_ENOENT,
		/**
		 * The client ran out of memory
		 */
		CLIENT_ENOMEM,
		/**
		 * Client could not schedule the request. This is typically received
		 * when an operation is requested before the initial bootstrap has
		 * completed
		 */
		CLIENT_ENOCONF,
		/**
		 * The instance of libcouchbase can't be used in this context
		 */
		EBADHANDLE,
		/**
		 * Unexpected usage of the server protocol, like unexpected response.
		 * If you've received this error code, please record your steps and file
		 * the issue at: [[http://www.couchbase.com/issues/browse/MB]]
		 */
		SERVER_BUG,
		/**
		 * Libcouchbase cannot load the plugin because of version mismatch
		 */
		PLUGIN_VERSION_MISMATCH,
		/**
		 * The bootstrap hosts list use an invalid/unsupported format
		 */
		INVALID_HOST_FORMAT,
		/**
		 * Invalid character used in the path component of an URL
		 */
		INVALID_CHAR,

		/**
		 * Too many nodes were requested for the observe criteria
		 */
		DURABILITY_ETOOMANY,

		/**
		 * The same key was passed multiple times in a command list
		 */
		DUPLICATE_COMMANDS,

		/**
		 * The config says that there is no server yet at that
		 * position (-1 in the vbucket map)
		 */
		NO_MATCHING_SERVER,

		/**
		 * An environment variable recognized by libcouchbase was detected,
		 * but it contains an invalid value format
		 */
		BAD_ENVIRONMENT,

		/**
		 * An operation has not yet completed.
		 */
		BUSY,

		/** 
		 * Administrator account must not be used to access the data in the
		 * bucket.
		 */
		INVALID_USERNAME,

		/**
		 * The contents of the configuration cache file are invalid.
		 */
		CONFIG_CACHE_INVALID,

		/**
		 * The requested SASL mechanism (forced via lcb_cntl) was not
		 * available for use
		 */
		SASLMECH_UNAVAILABLE,

		/**
		 * Maximum allowed number redirects reached. See lcb_cntl(3)
		 * manpage for LCB_MAX_REDIRECTS options to get/set this limit.
		 */
		TOO_MANY_REDIRECTS,

		/**
         * May be received in operation callbacks if the cluster toplogy changed
		 * and the library could not remap the command to a new node. This may
         * be because the internal structure lacked sufficient information to
         * recreate the packet, or because the configuration settings indicated
         * that the command should not be retried.
         * @see LCB_CNTL_RETRYMODE
         */
		MAP_CHANGED,

		/**
         * Returned from the lcb_pktfwd3() function if an incomplete packet was
		 * passed
         */
		INCOMPLETE_PACKET,

		/**
         * Mapped directly to the system `ECONNREFUSED` errno. This is received
		 * in callbacks if an initial connection to the node could not be
         * established. Check your firewall settings and ensure the specified
         * service is online.
         */
		ECONNREFUSED,

		/**
         * Returned in a callback if the socket connection was gracefully
         * closed, but the library wasn't expecting it. This may happen if the
         * system is being shut down.
		 * @lcb_see_detailed_neterr
         */
		ESOCKSHUTDOWN,

		/**
		 * Returned in a callback if the socket connection was forcefully reset,
		 * Equivalent to the system `ECONNRESET`.
		 * @lcb_see_detailed_neterr
		 */
		ECONNRESET,

		/**
		 * Returned in a callback if the library could not allocated a local
		 * socket due to TCP local port exhaustion. This means you have either
		 * found a bug in the library or are creating too many TCP connections.
		 * Keep in mind that a TCP connection will still occupy a slot in your
		 * system socket table even after it has been closed (and will thus
		 * appear in a `TIME_WAIT` state).
		 * @lcb_see_detailed_neterr
		 */
		ECANTGETPORT,

		/**
		 * Returned if the library could not allocate a new file descriptor for
		 * a socket or other resource. This may be more common on systems (such
		 * as Mac OS X) which have relatively low limits for file descriptors.
		 * To raise the file descriptor limit, refer to the `ulimit -n` command
		 * @lcb_see_detailed_neterr
		 */
		EFDLIMITREACHED,

		/**
		 * Returned in callback if the host or subnet containing a node could
		 * not be contacted. This may be a result of a bad routing table or
		 * being physically disconnected from the network.
		 * @lcb_see_detailed_neterr.
		 */
		ENETUNREACH,

		/**
		 * An unrecognized setting was passed to the lcb_cntl() function
		 * @lcb_see_detailed_neterr
		 */
		ECTL_UNKNOWN,

		/**
		 * An invalid operation was supplied for a setting to lcb_cntl(). This
		 * will happen if you try to write to a read-only setting, or retrieve a
		 * value which may only be set. Refer to the documentation for an
		 * individual setting
		 * to see what modes it supports.
		 * @lcb_see_detailed_neterr
		 */
		ECTL_UNSUPPMODE,

		/**
		 * A malformed argument was passed to lcb_cntl() for the given setting.
		 * See the documentation for the setting to see what arguments it
		 * supports and how they are to be supplied.
		 * @lcb_see_detailed_neterr
		 */
		ECTL_BADARG,

		/**
		 * An empty key was passed to an operation. Most commands do not accept
		 * empty keys.
		 */
		EMPTY_KEY,

		/**
		 * A problem with the SSL system was encountered. Use logging to
		 * discover what happened. This error will only be thrown if something
		 * internal to the SSL library failed (for example, a bad certificate or
		 * bad user input); otherwise a network error will be thrown if an SSL
		 * connection was terminated
		 */
		SSL_ERROR,

		/**
		 * The certificate the server sent cannot be verified. This is a
		 * possible case of a man-in-the-middle attack, but also of forgetting
		 * to supply the path to the CA authority to the library.
		 */
		SSL_CANTVERIFY,
		
		/**
		 * Internal error used for destroying unscheduled command data
		 */
		SCHEDFAIL_INTERNAL,
		
		/**
		 * An optional client feature was requested, but the current
		 * configuration does not allow it to be used. This might be because it
		 * is not available on a particular platform/architecture/operating
		 * system/configuration, or it has been disabled at the time the library
		 * was built.
		 */
		CLIENT_FEATURE_UNAVAILABLE,

		/**
		 * An option was passed to a command which is incompatible with other
		 * options. This may happen if two fields are mutually exclusive
		 */
		OPTIONS_CONFLICT,

		/**
		 * Received in callbacks if an operation failed because of a negative
		 * HTTP status code
		 */
		HTTP_ERROR,
		
		/**
		 * Scheduling error received if @ref LCB_CNTL_DURABILITY_MUTATION_TOKENS
		 * was enabled, but there is no available mutation token for the key.
		 */
		DURABILITY_NO_MUTATION_TOKENS,
		
		/**
		 * The server replied with an unrecognized status code
		 */
		UNKNOWN_MEMCACHED_ERROR,
		
		/**
		 * The server replied that the given mutation has been lost
		 */
		MUTATION_LOST,
		
		/**
		 * Sub-document path does not exist
		 */
		SUBDOC_PATH_ENOENT,
		
		/**
		 * Type of element in sub-document path conflicts with type in document
		 */
		SUBDOC_PATH_MISMATCH,
		
		/**
		 * Malformed sub-document path
		 */
		SUBDOC_PATH_EINVAL,
		
		/**
		 * Sub-document contains too many components
		 */
		SUBDOC_PATH_E2BIG,
		
		/**
		 * Existing document contains too many levels of nesting
		 */
		SUBDOC_DOC_E2DEEP,
		
		/**
		 * Subdocument operation would invalidate the JSON
		 */
		SUBDOC_VALUE_CANTINSERT,
		
		/**
		 * Existing document is not valid JSON
		 */
		SUBDOC_DOC_NOTJSON,
		
		/**
		 * The existing numeric value is too large
		 */
		SUBDOC_NUM_ERANGE,
		
		/**
		 * Delta must be numeric, within the 64 bit signed range, and non-zero
		 */
		SUBDOC_BAD_DELTA,
		
		/**
		 * The given path already exists in the document
		 */
		SUBDOC_PATH_EEXISTS,
		
		/**
		 * Could not execute one or more multi lookups or mutations
		 */
		SUBDOC_MULTI_FAILURE,
		
		/**
		 * Value is too deep to insert
		 */
		SUBDOC_VALUE_E2DEEP,
		
		/**
		 * A badly formatted packet was sent to the server. Please report this
		 * in a bug
		 */
		EINVAL_MCD,
		
		/**
		 * Missing subdocument path
		 */
		EMPTY_PATH,
		
		/**
		 * Unknown subdocument command
		 */
		UNKNOWN_SDCMD,
		
		/**
		 * No commands specified
		 */
		ENO_COMMANDS,
		
		/**
		 * Query execution failed. Inspect raw response object for information
		 */
		QUERY_ERROR
	}

	[CCode (cname = "lcb_io_ops_type_t", cprefix = "LCB_IO_OPS_", has_type_id = false)]
	public enum IOType {
		INVALID,
		DEFAULT,
		LIBEVENT,
		WINSOCK,
		LIBEV,
		SELECT,
		WINIOCP,
		LIBUV
	}

	[SimpleType]
	[CCode (cname = "lcb_io_opt_st")]
	public struct IO {
		public int version;
		public void* dlhandle;
		public void* iops;
	}

	[Compact]
	[CCode (cname = "struct lcb_create_io_ops_st", destroy_function = "")]
	public struct IOOptions {
		public int version;
		[CCode (cname = "v.v0.type")]
		public IOType v0_type;
		[CCode (cname = "v.v0.cookie")]
		public void* v0_cookie;

		[CCode (cname = "v.v1.sofile")]
		public string v1_sofile;
		[CCode (cname = "v.v1.symbol")]
		public string v1_symbol;
		[CCode (cname = "v.v1.cookie")]
		public void* v1_cookie;

	}

	[SimpleType]
	[CCode (cname = "lcb_config_transport_t", cprefix="LCB_CONFIG_TRANSPORT_")]
	public enum Transport {
		LIST_END,
		HTTP,
		CCCP,
		MAX
	}

	[SimpleType]
	[CCode (cname = "lcb_type_t", cprefix="LCB_TYPE_")]
	public enum ConnectionType {
		BUCKET,
		CLUSTER
	}

	[SimpleType]
	[CCode (cname = "lcb_syncmode_t", cprefix="LCB_")]
	public enum SyncMode {
		ASYNCHRONOUS,
		SYNCHRONOUS
	}

	[SimpleType]
	[CCode (cname = "lcb_storage_t", cprefix="LCB_")]
	public enum Storage {
        /**
         * Add the item to the cache, but fail if the object exists already
         */
		ADD,
        /**
         * Replace the existing object in the cache
         */
		REPLACE,
        /**
         * Unconditionally set the object in the cache
         */
		SET,
        /**
         * Append this object to the existing object
         */
		APPEND,
        /**
         * Prepend this object to the existing object
         */
		PREPEND
	}

	[SimpleType]
	[CCode (cname = "lcb_replica_t", cprefix="LCB_REPLICA_")]
	public enum Replica {
		FIRST,
		ALL,
		SELECT
	}

	/**
	 * Possible statuses for keys in OBSERVE response
	 */
	[SimpleType]
	[CCode (cname = "lcb_observe_t", cprefix="LCB_REPLICA_")]
	public enum Observe {
		/**
		 * The item found in the memory, but not yet on the disk
		 */
		FOUND,
		/**
		 * The item hit the disk
		 */
		PERSISTED,
		/**
		 * The item missing on the disk and the memory
		 */
		NOT_FOUND,
		/**
		 * No knowledge of the key
		 */
		LOGICALLY_DELETED
	}

	[SimpleType]
	[CCode (cname = "lcb_verbosity_level_t", cprefix="LCB_VERBOSITY_")]
	public enum Verbosity {
		DETAIL,
		DEBUG,
		INFO,
		WARNING
	}

	[SimpleType]
	[CCode (cname = "lcb_http_type_t", cprefix="LCB_HTTP_TYPE_")]
	public enum HttpType {
		VIEW,
		MANAGEMENT,
		RAW,
		MAX
	}

	[SimpleType]
	[CCode (cname = "lcb_http_method_t", cprefix="LCB_HTTP_METHOD_")]
	public enum HttpMethod {
		GET,
		POST,
		PUT,
		DELETE,
		MAX
	}

	/**
	 * Modes for the cntl() mode argument.
	 */
	[CCode (cname = "int", cprefix = "LCB_CNTL_", has_type_id = false)]
	public enum CntlMode {
		/**
		 * Modify a setting
		 */
		SET,
		/**
		 * Retrieve a setting
		 */
		GET
	}

	/**
	 * Commands for the cntl() cmd argument.
	 */
	[CCode (cname = "int", cprefix = "LCB_CNTL_", has_type_id = false)]
	public enum CntlCommand {
		/**
		 * Operation Timeout
		 *
		 * The operation timeout is the maximum amount of time the library will wait
		 * for an operation to receive a response before invoking its callback with
		 * a failure status.
		 *
		 * An operation may timeout if:
		 *
		 * * A server is taking too long to respond
		 * * An updated cluster configuration has not been promptly received
		 */
		OP_TIMEOUT,

		/**
		 * Views Timeout
 		 * This is the I/O timeout for HTTP requests issues
		 */
		VIEW_TIMEOUT,

        /**
         * N1QL Timeout
         * This is the I/O timeout for N1QL queries, issued via n1ql_query()
         */
        N1QL_TIMEOUT,

        /**
         * Get the name of the bucket
         * This returns the name of the bucket this instance is connected to, or `NULL`
         * if not yet connected to a bucket
         */
        BUCKETNAME,

        /**
         * Get the handle type.
         * This returns the handle type - which is either CLUSTER or BUCKET
         */
        HANDLETYPE,

        /**
         * Get the vBucket handle.
         * Obtains the current cluster configuration from the client.
         */
        VBCONFIG,

        /**
         * Get the iops implementation instance
         */
        IOPS,

        /**
         * Get the vBucket ID for a given key, based on the current
         * configuration
         */
        VBMAP,

        /**
         * Configuration error threshold.
         *
         * This number indicates how many network/mapping/not-my-vbucket errors
         * are received before a configuration update is requested again.
         */
        CONFERRTHRESH,

        /**
         * Default timeout for durability_poll()
         * This is the time the client will spend sending repeated probes to a
         * given key's vBucket masters and replicas before they are deemed not
         * to have satisfied the durability requirements
         */
        DURABILITY_TIMEOUT,

        /**
         * Polling grace interval for durability_poll()
         * This is the time the client will wait between repeated probes to a
         * given server.
         */
        DURABILITY_INTERVAL,

        /**
         * Timeout for non-views HTTP requests
         */
        HTTP_TIMEOUT,

        /**
         * Print verbose plugin load information to console
         *
         * This modifies a static, global setting regarding whether to print
         * verbose information when trying to dynamically load an IO plugin.
         * The information printed can be useful in determining why a plugin
         * failed to load. This setting can also be controlled via the
         * "LIBCOUCHBASE_DLOPEN_DEBUG" environment variable (and if enabled from
         * the environment, will override the setting mentioned here).
         */
        IOPS_DLOPEN_DEBUG,

        /**
         * Initial bootstrap timeout.
         * This is how long the client will wait to obtain the initial configuration.
         */
        CONFIGURATION_TIMEOUT,

        /**
         * Randomize order of bootstrap nodes.
         *
         * This controls whether the connection attempts for configuration
         * retrievals should be done in the supplied order or whether they
         * should be randomized.
         *
         * For the initial connection the supplied order is the list of hosts
         * provided in the lcb_create_st structure. For subsequent connections
         * this is the order of nodes as received by the server.
         */
        RANDOMIZE_BOOTSTRAP_HOSTS,

        /**
         * Determine if file-based configuration has been loaded
         *
         * If the configuration cache is in use, the argument pointer
         * will be set to a true value. If the configuration cache was not used,
         * the argument pointer will be set to false.
         *
         * A false value may indicates that the client will need to load the
         * configuration from the network. This may be caused by the following:
         * - The configuration cache did not exist or was empty
         * - The configuration cache contained stale information
         */
        CONFIG_CACHE_LOADED,

        /**
         * Force a specific SASL mechanism
         *
         * Force a specific SASL mechanism to use for authentication. This
         * can allow a user to ensure a certain level of security and have the
         * connection fail if the desired mechanism is not available.
         *
         * When setting this value, the arg parameter shall be a
         * `NUL`-terminated string or a `NULL` pointer (to unset). When
         * retrieving this value, the parameter shall be set to a `char **`.
         * Note that this value (in CntlMode.GET) is valid only until the next
         * call to a libcouchbase API, after which it may have been freed.
         */
        FORCE_SASL_MECH,

        /**
         * Maximum number of HTTP redirects to follow
         * Set how many redirects the library should follow for the single
         * request. Set to -1 to remove limit at all.
         */
        MAX_REDIRECTS
	}

	/**
	 * ConnectionOptions to pass to create.
	 * var connect_options = LibCouchbase.ConnectionOptions(
	 *   version = 3,
	 *   v3_host = "couchbase://localhost/default",
	 *   v3_passwd = "secret"
	 * );
	 */
	[Compact]
	[CCode (cname = "struct lcb_create_st", destroy_function = "")]
	public struct ConnectionOptions {
		public int version;
		[CCode (cname = "v.v0.host")]
		public string v0_host;
		[CCode (cname = "v.v0.user")]
		public string v0_user;
		[CCode (cname = "v.v0.passwd")]
		public string v0_passwd;
		[CCode (cname = "v.v0.bucket")]
		public string v0_bucket;
		[CCode (cname = "v.v0.io")]
		public unowned IO v0_io;

		[CCode (cname = "v.v1.host")]
		public string v1_host;
		[CCode (cname = "v.v1.user")]
		public string v1_user;
		[CCode (cname = "v.v1.passwd")]
		public string v1_passwd;
		[CCode (cname = "v.v1.bucket")]
		public string v1_bucket;
		[CCode (cname = "v.v1.io")]
		public unowned IO v1_io;
		[CCode (cname = "v.v1.type")]
		public unowned ConnectionType v1_type;

		[CCode (cname = "v.v2.host")]
		public string v2_host;
		[CCode (cname = "v.v2.user")]
		public string v2_user;
		[CCode (cname = "v.v2.passwd")]
		public string v2_passwd;
		[CCode (cname = "v.v2.bucket")]
		public string v2_bucket;
		[CCode (cname = "v.v2.io")]
		public unowned IO v2_io;
		[CCode (cname = "v.v2.type")]
		public unowned ConnectionType v2_type;
		[CCode (cname = "v.v2.mchosts")]
		public string v2_mchosts;
		[CCode (cname = "v.v2.transports")]
		public unowned Transport[] v2_transports;

		[CCode (cname = "v.v3.connstr")]
		public string v3_connstr;
		[CCode (cname = "v.v3.username")]
		public string v3_username;
		[CCode (cname = "v.v3.passwd")]
		public string v3_passwd;
		[CCode (cname = "v.v3.io")]
		public unowned IO v3_io;
		[CCode (cname = "v.v3.type")]
		public unowned ConnectionType v3_type;
	}

	[Compact]
	[CCode (cname = "lcb_get_resp_t", destroy_function = "")]
	public struct GetResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.bytes", array_length_cname = "v.v0.nbytes", array_length_type = "size_t")]
		public uint8[] bytes;
		[CCode (cname = "v.v0.flags")]
		public uint32 flags;
		[CCode (cname = "v.v0.cas")]
		public uint64 cas;
		[CCode (cname = "v.v0.data_type")]
		public uint8 data_type;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}

		/**
		 * Retrieve bytes as string.
		 */
		public string bytes_string() {
			return uint8_to_terminated_string( bytes[0:bytes.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_observe_resp_t", destroy_function = "")]
	public struct ObserveResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.cas")]
		public uint64 cas;
		[CCode (cname = "v.v0.status")]
		public Observe status;
		[CCode (cname = "v.v0.from_master")]
		public int from_master;
		[CCode (cname = "v.v0.ttp")]
		public time_t time_to_persist;
		[CCode (cname = "v.v0.ttr")]
		public time_t time_to_replicate;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_store_resp_t", destroy_function = "")]
	public struct StoreResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.cas")]
		public uint64 cas;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_remove_resp_t", destroy_function = "")]
	public struct RemoveResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.cas")]
		public uint64 cas;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_touch_resp_t", destroy_function = "")]
	public struct TouchResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.cas")]
		public uint64 cas;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_unlock_resp_t", destroy_function = "")]
	public struct UnlockResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_arithmetic_resp_t", destroy_function = "")]
	public struct ArithmeticResponseInfo {
		public int version;
		[CCode (cname = "v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.value")]
		public uint64 value;
		[CCode (cname = "v.v0.cas")]
		public uint64 cas;

		/**
		 * Retrieve key as string.
		 */
		public string key_string() {
			return uint8_to_terminated_string( key[0:key.length] );
		}
	}

	[Compact]
	[CCode (cname = "lcb_flush_resp_t", destroy_function = "")]
	public struct FlushResponseInfo {
		public int version;
		[CCode (cname = "v.v0.server_endpoint")]
		public string server_endpoint;
	}

    /**
     * Create a new instance of one of the library-supplied io ops types.
     * @param op Where to store the io ops structure
     * @param options How to create the io ops structure
     * @return StatusResponse.SUCCESS on success
     */
	[CCode (cname = "lcb_create_io_ops", destroy_method = "lcb_destroy_io_ops")]
	public static StatusResponse create_io_options ( ref IO op, ref IOOptions options );

	[Compact]
	[CCode (cname = "lcb_get_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct GetCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname="v.v0.exptime")]
		public time_t exptime;
		[CCode (cname="v.v0.lock")]
		public int lock;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_store_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct StoreCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname = "v.v0.bytes", array_length_cname = "v.v0.nbytes", array_length_type = "size_t")]
		public uint8[] bytes;
		[CCode (cname="v.v0.flags")]
		public uint32 flags;
		[CCode (cname="v.v0.cas")]
		public uint64 cas;
		[CCode (cname="v.v0.datatype")]
		public uint8 datatype;
		[CCode (cname="v.v0.exptime")]
		public time_t exptime;
		[CCode (cname="v.v0.operation")]
		public Storage operation;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_unlock_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct UnlockCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname="v.v0.cas")]
		public uint64 cas;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_get_replica_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct GetReplicaCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] v0_key;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] v0_hashkey;
		[CCode (cname="v.v1.key", array_length_cname = "v.v1.nkey", array_length_type = "size_t")]
		public uint8[] v1_key;
		[CCode (cname="v.v1.hashkey", array_length_cname = "v.v1.nhashkey", array_length_type = "size_t")]
		public uint8[] v1_hashkey;
		[CCode (cname="v.v1.strategy")]
		public Replica v1_strategy;
		[CCode (cname="v.v1.index")]
		public size_t v1_index;
	}

	[Compact]
	[CCode (cname = "lcb_touch_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct TouchCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname="v.v0.exptime")]
		public time_t exptime;
		[CCode (cname="v.v0.lock")]
		public int lock;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_arithmetic_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct ArithmeticCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname="v.v0.exptime")]
		public time_t exptime;
		[CCode (cname="v.v0.create")]
		public int create;
		[CCode (cname="v.v0.delta")]
		public int64 delta;
		[CCode (cname="v.v0.initial")]
		public uint64 initial;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_observe_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct ObserveCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_remove_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct RemoveCommand {
		public int version;
		[CCode (cname="v.v0.key", array_length_cname = "v.v0.nkey", array_length_type = "size_t")]
		public uint8[] key;
		[CCode (cname="v.v0.cas")]
		public uint64 cas;
		[CCode (cname="v.v0.hashkey", array_length_cname = "v.v0.nhashkey", array_length_type = "size_t")]
		public uint8[] hashkey;
	}

	[Compact]
	[CCode (cname = "lcb_server_stats_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct ServerStatsCommand {
		public int version;
		[CCode (cname="v.v0.name", array_length_cname = "v.v0.nname", array_length_type = "size_t")]
		public uint8[] name;
	}

	[Compact]
	[CCode (cname = "lcb_server_version_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct ServerVersionCommand {
		public int version;
	}

	[Compact]
	[CCode (cname = "lcb_verbosity_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct VerbosityCommand {
		public int version;
		[CCode (cname="v.v0.server")]
		public string server;
		[CCode (cname="v.v0.level")]
		public Verbosity level;
	}

	[Compact]
	[CCode (cname = "lcb_flush_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct FlushCommand {
		public int version;
	}

	[Compact]
	[CCode (cname = "lcb_http_cmd_t", destroy_function = "", has_copy_function = false)]
	public struct HttpCommand {
		public int version;
		/**
		 * A view path string with optional query params (e.g. skip, limit etc.)
		 */
		[CCode (cname="v.v0.path", array_length_cname = "v.v0.npath", array_length_type = "size_t")]
		public uint8[] path;
		/**
		 * The POST body for HTTP request
		 */
		[CCode (cname="v.v0.body", array_length_cname = "v.v0.nbody", array_length_type = "size_t")]
		public uint8[] body;
		/**
		 * HTTP message type to be sent to server
		 */
		[CCode (cname="v.v0.method")]
		public HttpMethod method;
		/**
		 * If true the client will use HttpDataCallback to notify about response
		 * and will call HttpComplete with empty data eventually.
		 */
		[CCode (cname="v.v0.chunked")]
		public int chunked;
		/**
		 * The 'Content-Type' header for request. For view requests it is
		 * usually "application/json", for management --
		 * "application/x-www-form-urlencoded".
		 */
		[CCode (cname="v.v0.content_type")]
		public string content_type;
	}

	[Compact]
	[CCode (cname = "lcb_http_request_t", destroy_function = "")]
	public struct HttpRequest {
	}

	[Compact]
	[CCode (cname = "lcb_http_resp_t", destroy_function = "")]
	public struct HttpResponse {
		[CCode (cname="v.v0.status")]
		public int status;
		[CCode (cname="v.v0.path", array_length_cname = "v.v0.npath", array_length_type = "size_t")]
		public uint8[] path;
		[CCode (cname="v.v0.headers", array_length = false)]
		public string[] headers;
		[CCode (cname="v.v0.bytes", array_length_cname = "v.v0.nbytes", array_length_type = "size_t")]
		public uint8[] bytes;

		/**
		 * Retrieve path as string.
		 */
		public string path_string() {
			return uint8_to_terminated_string( path[0:path.length] );
		}

		/**
		 * Retrieve bytes as string.
		 */
		public string bytes_string() {
			return uint8_to_terminated_string( bytes[0:bytes.length] );
		}
	}

	/**
	 * The callback function for a "get-style" request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info More information about the actual item (only key
	 *             and nkey is valid if error != LCB_SUCCESS)
	 */
	[CCode (cname = "lcb_get_callback", has_target = false, has_type_id = false)]
	public delegate void GetCallback ( Client instance, void* cookie,
		StatusResponse status, GetResponseInfo response_info );

	/**
	 * The callback function for a storage request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param operation Storage type
	 * @param status The status of the operation
	 * @param response_info additional response info
	 */
	[CCode (cname = "lcb_store_callback", has_target = false, has_type_id = false)]
	public delegate void StoreCallback ( Client instance, void* cookie,
		Storage operation, StatusResponse status, StoreResponseInfo response_info );

	/**
	 * The callback function for a remove request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info additional response info
	 */
	[CCode (cname = "lcb_remove_callback", has_target = false, has_type_id = false)]
	public delegate void RemoveCallback ( Client instance, void* cookie,
		StatusResponse status, RemoveResponseInfo response_info );

	/**
	 * The callback function for a touch request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info additional response info
	 */
	[CCode (cname = "lcb_touch_callback", has_target = false, has_type_id = false)]
	public delegate void TouchCallback ( Client instance, void* cookie,
		StatusResponse status, TouchResponseInfo response_info );

	/**
	 * The callback function for an unlock request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info additional response info
	 */
	[CCode (cname = "lcb_unlock_callback", has_target = false, has_type_id = false)]
	public delegate void UnlockCallback ( Client instance, void* cookie,
		StatusResponse status, UnlockResponseInfo response_info );

	/**
	 * The callback function for an arithmetic request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info additional response info
	 */
	[CCode (cname = "lcb_arithmetic_callback", has_target = false, has_type_id = false)]
	public delegate void ArithmeticCallback ( Client instance, void* cookie,
		StatusResponse status, ArithmeticResponseInfo response_info );

    /**
	 * The callback function for an observe request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info More information about the operation (only key
	 *             is valid if response != LCB_SUCCESS)
	 */
	[CCode (cname = "lcb_observe_callback", has_target = false, has_type_id = false)]
	public delegate void ObserveCallback ( Client instance, void* cookie,
		StatusResponse status, ObserveResponseInfo response_info );

	/**
	 * The error callback called when we don't have a request context.
	 * This callback may be called when we encounter memory/network
	 * error(s), and we can't map it directly to an operation.
	 *
	 * @param instance the instance performing the operation
	 * @param status The StatusResponse we encountered
	 * @param error An optional string with more information about
	 *                the error (if available)
	 */
	[CCode (cname = "lcb_error_callback", has_target = false, has_type_id = false)]
	public delegate void ErrorCallback ( Client instance, StatusResponse status,
		string? error );

    /**
	 * The callback function for a flush request.
	 *
	 * @param instance the instance performing the operation
	 * @param cookie the cookie associated with with the command
	 * @param status The status of the operation
	 * @param response_info More information about the operation (only key
	 *             is valid if response != LCB_SUCCESS)
	 */
	[CCode (cname = "lcb_flush_callback", has_target = false, has_type_id = false)]
	public delegate void FlushCallback ( Client instance, void* cookie,
		StatusResponse status, FlushResponseInfo response_info );

	/**
	 * HttpCompleteCallback will notify that view execution was completed and
	 * lcb will pass response body to this callback unless HttpDataCallback is
	 * set up.
	 * @param request Source HttpRequest
	 * @param instance the instance performing the operation
	 * @param cookie Cookie from caller
	 * @param status The status of the operation
	 * @param response HttpResponse object
	 */
	[CCode (cname = "lcb_http_complete_callback", has_target = false, has_type_id = false)]
	public delegate void HttpCompleteCallback ( HttpRequest request, Client instance,
		void* cookie, StatusResponse status, HttpResponse* response );

	/**
	 * The libcouchbase client instance.
	 */
	[SimpleType]
	[CCode (cname = "lcb_t", free_function = "lcb_destroy", unref_function = "", lower_case_cprefix = "lcb_")]
	public struct Client {
		/**
		 * Alter whether get/store commands are synchronous or asynchronous.
		 */
		public SyncMode sync_mode {
			[CCode (cname = "lcb_behavior_get_syncmode")] get;
			[CCode (cname = "lcb_behavior_set_syncmode")] set;
		}

		/**
		 * Set the number of usec the library should allow an operation to
		 * be valid.
		 *
		 * Please note that the timeouts are <b>not</b> that accurate,
		 * because they may be delayed by the application code before it
		 * drives the event loop.
		 *
		 * Please note that timeouts is not stored on a per operation
		 * base, but on the instance. That means you <b>can't</b> pipeline
		 * two requests after eachother with different timeout values.
		 */
		public uint32 timeout {
			[CCode (cname = "lcb_get_timeout")] get;
			[CCode (cname = "lcb_set_timeout")] set;
		}

		public uint32 view_timeout {
			[CCode (cname = "lcb_get_view_timeout")] get;
			[CCode (cname = "lcb_set_view_timeout")] set;
		}

		/**
		 * Get the current host
		 */
		public string host {
			[CCode (cname = "lcb_get_host")] get;
		}

		/**
		 * Get the current port
		 */
		public string port {
			[CCode (cname = "lcb_get_port")] get;
		}

		/**
		 * Returns the last error that was seen within libcouchbase.
		 */
		public StatusResponse last_error {
			[CCode (cname = "lcb_get_last_error")] get;
		}

		/**
		 * Alter or retrieve cookie associated with this instance.
		 */
		public void* cookie {
			[CCode (cname = "lcb_get_cookie")] get;
			[CCode (cname = "lcb_set_cookie")] set;
		}

		/**
		 * Returns non-zero if the event loop is running now.
		 */
		public int is_waiting {
			[CCode (cname = "lcb_is_waiting")] get;
		}

		/**
		 * Get the number of the replicas in the cluster
		 */
		public int num_replicas {
			[CCode (cname = "lcb_get_num_replicas")] get;
		}

		/**
		 * Get the number of the nodes in the cluster
		 */
		public int num_nodes {
			[CCode (cname = "lcb_get_num_nodes")] get;
		}

		/**
		 * Get the version of the library.
		 *
		 * @param version where to store the numeric representation of the
		 *        version (or NULL if you don't care)
		 *
		 * @return the textual description of the version. Do <b>not</b> try to
		 *         release this string.
		 */
		public static unowned string get_version ( uint32? version = null );

		/**
		 * Determine if this version has support for a particular feature.
		 *
		 * @param feature ID to check for
		 *
		 * @return 0 if not supported, nonzero if supported
		 */
		public static int supports_feature ( int feature );

		/**
		 * Create an instance of the Couchbase Client.
		 *
		 * Example:
		 * Couchbase.StatusResponse response = instance.create(null);
		 * if (response != Couchbase.StatusResponse.SUCCESS) {
		 * .. failed to create instance ..
		 *
		 * @param client (out) Empty Couchbase.Client variables
		 * @param options (ref) ConnectionOptions struct, how to create the libcouchbase instance
		 * @return StatusResponse.SUCCESS on success
		 */
		public static StatusResponse create ( out Client client, ref ConnectionOptions options );

		/**
		 * Connect to the server and get the vbucket and serverlist.
		 */
		public StatusResponse connect ();

		/**
		 * This function exposes an ioctl/fcntl-like interface to read and write
		 * various configuration properties.
		 *
		 * @param mode CntlMode.GET to retrieve a setting, or CntlMode.SET to
		 *             modify a setting. Note that not all configuration
		 *             properties support SET.
		 *
		 * @param cmd The specific command/property to modify. This is one of the
		 *      LCB_CNTL_* constants defined in this file. Note that it is safe
		 *      (and even recommanded) to use the raw numeric value (i.e.
		 *      to be backwards and forwards compatible with libcouchbase
		 *      versions), as they are not subject to change.
		 *
		 *      Using the actual value may be useful in ensuring your application
		 *      will still compile with an older libcouchbase version (though
		 *      you may get a runtime error (see return) if the command is not
		 *      supported
		 *
		 * @param arg The argument passed to the configuration handler.
		 *      The actual type of this pointer is dependent on the
		 *      command in question.  Typically for GET operations, the
		 *      value of 'arg' is set to the current configuration value;
		 *      and for SET operations, the current configuration is
		 *      updated with the contents of *arg.
		 *
		 * @return ::LCB_NOT_SUPPORTED if the code is unrecognized
		 * @return ::LCB_EINVAL if there was a problem with the argument
		 *         (typically for LCB_CNTL_SET) other error codes depending on the command.
		 *
		 * The following error codes are returned if the ::LCB_CNTL_DETAILED_ERRCODES
		 * are enabled.
		 *
		 * @return ::LCB_ECTL_UNKNOWN if the code is unrecognized
		 * @return ::LCB_ECTL_UNSUPPMODE An invalid _mode_ was passed
		 * @return ::LCB_ECTL_BADARG if the value was invalid
		 *
		 * @committed
		 *
		 * @see lcb_cntl_setu32()
		 * @see lcb_cntl_string()
		 */
		public StatusResponse cntl ( int mode, int cmd, void* arg );

		/**
		 * Try to send/receive data buffered on the servers.
		 */
		public void flush_buffers ( void* cookie = null );

		/**
		 * Wait for the execution of all batched requests.
		 * @return whether the wait operation failed, or LCB_SUCCESS
		 */
		public StatusResponse wait ();

		/**
		 * Set a GetCallback method.
		 */
		public void set_get_callback ( GetCallback get_callback );

		/**
		 * Set a StoreCallback method.
		 */
		public void set_store_callback ( StoreCallback store_callback );

		/**
		 * Set a RemoveCallback method.
		 */
		public void set_remove_callback ( RemoveCallback remove_callback );

		/**
		 * Set a TouchCallback method.
		 */
		public void set_touch_callback ( TouchCallback touch_callback );

		/**
		 * Set an UnlockCallback method.
		 */
		public void set_unlock_callback ( UnlockCallback unlock_callback );

		/**
		 * Set an ArithmeticCallback method.
		 */
		public void set_arithmetic_callback ( ArithmeticCallback arithmetic_callback );

		/**
		 * Set an ObserveCallback method.
		 */
		public void set_observe_callback ( ObserveCallback observe_callback );

		/**
		 * Set an ErrorCallback method.
		 */
		public void set_error_callback ( ErrorCallback error_callback );

		/**
		 * Set a FlushCallback method.
		 */
		public void set_flush_callback ( FlushCallback flush_callback );

		/**
		 * Set an HttpCompleteCallback method.
		 */
		public void set_http_complete_callback ( HttpCompleteCallback http_complete_callback );

		/**
		 * Stop event loop. Might be useful to breakout the event loop.
		 */
		public void breakout ();

		/**
		 * Get a textual description for the given error code.
		 * @param status StatusResponse code.
		 */
		[CCode (cname="lcb_strerror")]
		public unowned string? get_error( StatusResponse status );

		/**
		 * Get a number of values from the cache.
		 *
		 * If you specify a non-zero value for expiration, the server will
		 * update the expiration value on the item (refer to the
		 * documentation on cmd_store to see the meaning of the
		 * expiration). All other members should be set to zero.
		 *
		 * Example:
		 * {{{
		 *   GetCommand gc = GetCommand() {
		 *       key = "my-key"
		 *   };
		 *   // Set an expiration of 60 (optional)
		 *   gc.exptime = 60;
		 *   GetCommand*[] commands = { &gc };
		 *   instance.get( null, commands );
		 * }}}
		 * It is possible to get an item with a lock that has a timeout. It can
		 * then be unlocked with either a CAS operation or with an explicit
		 * unlock command.
		 *
		 * You may specify the expiration value for the lock in the
		 * expiration (setting it to 0 cause the server to use the default
		 * value).
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to get
		 * @return The status of the operation
		 */
		public StatusResponse get ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] GetCommand*[] commands );

		/**
		 * Store an item in the cluster.
		 *
		 * You may initialize all of the members in the the
		 * lcb_item_st structure with the values you want.
		 * Values larger than 30*24*60*60 seconds (30 days) are
		 * interpreted as absolute times (from the epoch). Unused members
		 * should be set to zero.
		 *
		 * Example:
		 * {{{
		 *   StoreCommand sc = StoreCommand() {
		 *       version = 0,
		 *       key = "my-key",
		 *       bytes = "{ value:666 }".data,
		 *       flags = 0xdeadcafe,
		 *       cas = 0x1234,
		 *       exptime = 0x666,
		 *       datatype = DataType.JSON,
		 *       operation = Storage.REPLACE
		 *   };
		 *   StoreCommand*[] commands = { &sc };
		 *   instance.store( null, commands );
		 * }}}
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to store
		 * @return The status of the operation
		 */
		public StatusResponse store ( void* command_cookie, [CCode (array_length_pos = 1.0)] StoreCommand*[] commands );

		/**
		 * Get a number of replica values from the cache.
		 *
		 * Example:
		 * {{{
		 *   GetReplicaCommand grc = GetReplicaCommand() {
		 *       key = "my-key"
		 *   };
		 *   GetReplicaCommand*[] commands = { &grc };
		 *   instance.get_replica( null, commands );
		 * }}}
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to get
		 * @return The status of the operation
		 */
		public StatusResponse get_replica ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] GetReplicaCommand*[] commands );

		/**
		 * Unlock the key locked with get_locked
		 *
		 * You should initialize the key and cas member in the UnlockCommand
		 * structure for the keys to get. All other members should be set to
		 * zero.
		 *
		 * Example:
		 * {{{
		 *   UnlockCommand uc = UnlockCommand() {
		 *       key = "my-key",
		 *       cas = 0x666
		 *   };
		 *   UnlockCommand*[] commands = { &uc };
		 *   instance.unlock( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to unlock
		 * @return The status of the operation
		 */
		public StatusResponse unlock ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] UnlockCommand*[] commands );

		/**
		 * Touch (set expiration time) on a number of values in the cache.
		 *
		 * Values larger than 30*24*60*60 seconds (30 days) are
		 * interpreted as absolute times (from the epoch). All other
		 * members should be set to zero.
		 *
		 * Example:
		 * {{{
		 *   TouchCommand tc = TouchCommand() {
		 *       key = "my-key",
		 *       exptime = 0x666
		 *   };
		 *   TouchCommand*[] commands = { &tc };
		 *   instance.touch( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to touch
		 * @return The status of the operation
		 */
		public StatusResponse touch ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] TouchCommand*[] commands );

		/**
		 * Perform arithmetic operation on a keys value.
		 *
		 * Example:
		 * {{{
		 *   ArithmeticCommand ac = ArithmeticCommand() {
		 *       key = "my-key",
		 *       initial = 0x666,
		 *       create = 1,
		 *       delta = 1
		 *   };
		 *   ArithmeticCommand*[] commands = { &ac };
		 *   instance.arithmetic( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to operate on
		 * @return Status of the operation.
		 */
		public StatusResponse arithmetic ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] ArithmeticCommand*[] commands );

		/**
		 * Observe key.
		 *
		 * Example:
		 * {{{
		 *   ObserveCommand oc = ObserveCommand() {
		 *       key = "my-key"
		 *   };
		 *   ObserveCommand*[] commands = { &oc };
		 *   instance.observe( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to observe
		 * @return The status of the operation
		 */
		public StatusResponse observe ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] ObserveCommand*[] commands );

		/**
		 * Remove a key from the cluster
		 *
		 * Example:
		 * {{{
		 *   RemoveCommand rc = RemoveCommand() {
		 *       key = "my-key"
		 *   };
		 *   RemoveCommand*[] commands = { &rc };
		 *   instance.remove( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the items to remove
		 */
		public StatusResponse remove ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] RemoveCommand*[] commands );

		/**
		 * Request server statistics. Without a key specified the server will
		 * respond with a "default" set of statistics information. Each piece of
		 * statistical information is returned in its own packet (key contains
		 * the name of the statistical item and the body contains the value in
		 * ASCII format). The sequence of return packets is terminated with a
		 * packet that contains no key and no value.
		 *
		 * The command will signal about transfer completion by passing NULL as
		 * the server endpoint and 0 for key length. Note that key length will
		 * be zero when some server responds with error. In latter case server
		 * endpoint argument will indicate the server address.
		 *
		 * Example:
		 * {{{
		 *   ServerStatsCommand ssc = ServerStatsCommand() {
		 *       name = "my-key"
		 *   };
		 *   ServerStatsCommand*[] commands = { &ssc };
		 *   instance.server_stats( null, commands );
		 * }}}
		 *
		 * @param command_cookie a cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the statistic to get
		 * @return The status of the operation
		 */
		public StatusResponse server_stats ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] ServerStatsCommand*[] commands );

		/**
		 * Request server versions. The callback will be invoked with the
		 * instance, server address, version string, and version string length.
		 *
		 * When all server versions have been received, the callback is invoked
		 * with the server endpoint argument set to NULL
		 *
		 * Example
		 * {{{
		 *   ServerVersionCommand svc = ServerVersionCommand();
		 *   ServerVersionCommand*[] commands = { &svc };
		 *   instance.server_versions( null, commands );
		 * }}}
		 *
		 * @param command_cookie a cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the version commands
		 * @return The status of the operation
		 */
		public StatusResponse server_versions ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] ServerVersionCommand*[] commands = {} );

		/**
		 * Set the loglevel on the servers.
		 *
		 * Example
		 * {{{
		 *   VerbosityCommand vc = VerbosityCommand() {
		 *       level = Verbosity.WARNING
		 *   };
		 *   VerbosityCommand*[] commands = { &vc };
		 *   instance.verbosity( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the verbosity commands
		 * @return The status of the operation.
		 */
		public StatusResponse set_verbosity ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] VerbosityCommand*[] commands );

		/**
		 * Flush the entire couchbase cluster!
		 *
		 * Example
		 * {{{
		 *   FlushCommand fc = FlushCommand();
		 *   FlushCommand*[] commands = { &fc };
		 *   instance.flush( null, commands );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param commands the array containing the flush commands
		 * @return The status of the operation.
		 */
		public StatusResponse flush ( void* command_cookie = null, [CCode (array_length_pos = 1.0)] FlushCommand*[] commands );

		/**
		 * Execute HTTP request matching given path and yield JSON result object.
		 * Depending on type it could be:
		 *
		 * - HttpType.VIEW
		 *
		 *   The client should setup view_complete callback in order to fetch
		 *   the result. Also he can setup view_data callback to fetch response
		 *   body in chunks as soon as possible, it will be called each time the
		 *   library receive a data chunk from socket. The empty <tt>bytes</tt>
		 *   argument (NULL pointer and zero size) is the sign of end of
		 *   response. Chunked callback allows to save memory on large datasets.
		 *
		 * - HttpType.MANAGEMENT
		 *
		 *   Management requests allow you to configure the cluster, add/remove
		 *   buckets, rebalance etc. The result will be passed to management
		 *   callbacks (data/complete).
		 *
		 * Example: Fetch first 10 docs from '_design/test/_view/all' view
		 * {{{
		 *   HttpRequest req = HttpRequest();
		 *   HttpCommand cmd = HttpCommand() {
		 *       path = "_design/test/_view/all?limit=10",
		 *       body = null,
		 *       method = HttpMethod.GET,
		 *       chunked = 1,
		 *       content_type = "application/json"
		 *   };
		 *   StatusResponse response = instance.make_http_request(
		 *       null, HttpType.VIEW, &cmd, &req
		 *   );
		 * }}}
		 * Example: The same as above but with POST filter
		 * {{{
		 *   HttpRequest req = HttpRequest();
		 *   HttpCommand cmd = HttpCommand() {
		 *       path = "_design/test/_view/all?limit=10".data,
		 *       body = """{"keys": ["test_1000", "test_10002"]}""".data,
		 *       method = HttpMethod.POST,
		 *       chunked = 0,
		 *       content_type = "application/json"
		 *   };
		 *   StatusResponse response = instance.make_http_request(
		 *       null, HttpType.VIEW, ref cmd, ref req
		 *   );
		 * }}}
		 *
		 * Example: Delete bucket via REST management API
		 * {{{
		 *   HttpRequest req = HttpRequest();
		 *   HttpCommand cmd = HttpCommand() {
		 *       path = query.data,
		 *       body = null,
		 *       method = HttpMethod.DELETE,
		 *       chunked = 0,
		 *       content_type = "application/x-www-form-urlencoded"
		 *   };
		 *   StatusResponse response = instance.make_http_request(
		 *       null, HttpType.MANAGEMENT, ref cmd, ref req
		 *   );
		 * }}}
		 *
		 * @param command_cookie A cookie passed to all of the notifications
		 *                       from this command
		 * @param type The type of the request needed.
		 * @param command The struct describing the command options
		 * @param request Where to store request handle
		 */
		public StatusResponse make_http_request ( void* command_cookie = null,
			HttpType type, ref HttpCommand command, ref HttpRequest request );

		/**
		 * Cancel HTTP request (view or management API). This function could be
		 * called from the callback to stop the request.
		 *
		 * @param request The request handle
		 */
		public void cancel_http_request( ref HttpRequest request );
	}

	private static string uint8_to_terminated_string( uint8[] array ) {
		uint8[] terminated = new uint8[ array.length + 1 ];
		for ( int i = 0; i < array.length; i++ ) {
			terminated[i] = array[i];
		}
		terminated[array.length] = '\0';
		return (string) terminated;
	}
}
