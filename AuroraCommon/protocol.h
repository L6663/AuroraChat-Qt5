#ifndef AURORA_PROTOCOL_H
#define AURORA_PROTOCOL_H

#include <QtGlobal>
#include <QByteArray>
#include <QMetaType>

namespace AuroraProtocol
{
    static const quint32 PACKET_MAGIC = 0x41555241; // "AURA"
    static const int PACKET_HEADER_SIZE = 14;
    static const quint32 MAX_BODY_SIZE = 16 * 1024 * 1024;
    static const int MAX_FILE_SIZE = 20 * 1024 * 1024;

    enum MessageType
    {
        MSG_HEARTBEAT_REQ             = 100,
        MSG_HEARTBEAT_RESP            = 101,

        MSG_REGISTER_REQ              = 200,
        MSG_REGISTER_RESP             = 201,
        MSG_LOGIN_REQ                 = 202,
        MSG_LOGIN_RESP                = 203,
        MSG_LOGOUT_REQ                = 204,
        MSG_PROFILE_GET_REQ           = 205,
        MSG_PROFILE_GET_RESP          = 206,
        MSG_PROFILE_UPDATE_REQ        = 207,
        MSG_PROFILE_UPDATE_RESP       = 208,
        MSG_PASSWORD_CHANGE_REQ       = 209,
        MSG_PASSWORD_CHANGE_RESP      = 210,

        MSG_USER_SEARCH_REQ           = 300,
        MSG_USER_SEARCH_RESP          = 301,
        MSG_FRIEND_REQUEST_SEND_REQ   = 302,
        MSG_FRIEND_REQUEST_SEND_RESP  = 303,
        MSG_FRIEND_REQUEST_NOTICE     = 304,
        MSG_FRIEND_REQUEST_LIST_REQ   = 305,
        MSG_FRIEND_REQUEST_LIST_RESP  = 306,
        MSG_FRIEND_REQUEST_HANDLE_REQ = 307,
        MSG_FRIEND_REQUEST_HANDLE_RESP= 308,
        MSG_FRIEND_LIST_REQ           = 309,
        MSG_FRIEND_LIST_RESP          = 310,
        MSG_FRIEND_DELETE_REQ         = 311,
        MSG_FRIEND_DELETE_RESP        = 312,
        MSG_FRIEND_STATUS_NOTICE      = 313,

        MSG_PRIVATE_CHAT              = 400,
        MSG_PRIVATE_CHAT_ACK          = 401,
        MSG_HISTORY_REQ               = 403,
        MSG_HISTORY_RESP              = 404,
        MSG_MESSAGE_SEARCH_REQ        = 405,
        MSG_MESSAGE_SEARCH_RESP       = 406,
        MSG_MESSAGE_DELIVERED_REQ     = 407,
        MSG_MESSAGE_DELIVERED_RESP    = 408,
        MSG_MESSAGE_DELIVERY_NOTICE   = 409,
        MSG_MESSAGE_READ_REQ          = 410,
        MSG_MESSAGE_READ_RESP         = 411,
        MSG_MESSAGE_READ_NOTICE       = 412,

        MSG_GROUP_CREATE_REQ          = 500,
        MSG_GROUP_CREATE_RESP         = 501,
        MSG_GROUP_LIST_REQ            = 502,
        MSG_GROUP_LIST_RESP           = 503,
        MSG_GROUP_CHAT                = 504,
        MSG_GROUP_CHAT_ACK            = 505,
        MSG_GROUP_HISTORY_REQ         = 506,
        MSG_GROUP_HISTORY_RESP        = 507,
        MSG_GROUP_DETAIL_REQ          = 508,
        MSG_GROUP_DETAIL_RESP         = 509,
        MSG_GROUP_ADD_MEMBERS_REQ     = 510,
        MSG_GROUP_ADD_MEMBERS_RESP    = 511,
        MSG_GROUP_REMOVE_MEMBER_REQ   = 512,
        MSG_GROUP_REMOVE_MEMBER_RESP  = 513,
        MSG_GROUP_LEAVE_REQ           = 514,
        MSG_GROUP_LEAVE_RESP          = 515,
        MSG_GROUP_DISSOLVE_REQ        = 516,
        MSG_GROUP_DISSOLVE_RESP       = 517,
        MSG_GROUP_NOTICE              = 518,

        MSG_FILE_UPLOAD_REQ           = 600,
        MSG_FILE_UPLOAD_RESP          = 601,
        MSG_FILE_DOWNLOAD_REQ         = 602,
        MSG_FILE_DOWNLOAD_RESP        = 603,
        MSG_FILE_LIST_REQ             = 604,
        MSG_FILE_LIST_RESP            = 605,

        MSG_FILE_UPLOAD_BEGIN_REQ     = 606,
        MSG_FILE_UPLOAD_BEGIN_RESP    = 607,
        MSG_FILE_UPLOAD_CHUNK_REQ     = 608,
        MSG_FILE_UPLOAD_CHUNK_RESP    = 609,
        MSG_FILE_UPLOAD_END_REQ       = 610,
        MSG_FILE_UPLOAD_END_RESP      = 611,
        MSG_FILE_UPLOAD_ABORT_REQ     = 612,
        MSG_FILE_UPLOAD_ABORT_RESP    = 613,

        MSG_FILE_DOWNLOAD_BEGIN_REQ   = 614,
        MSG_FILE_DOWNLOAD_BEGIN_RESP  = 615,
        MSG_FILE_DOWNLOAD_CHUNK_REQ   = 616,
        MSG_FILE_DOWNLOAD_CHUNK_RESP  = 617,
        MSG_FILE_DOWNLOAD_ABORT_REQ   = 618,
        MSG_FILE_DOWNLOAD_ABORT_RESP  = 619,

        MSG_SYSTEM_NOTICE             = 700,
        MSG_FORCE_OFFLINE             = 701
    };

    enum SideItemType
    {
        SIDE_ITEM_FRIEND = 1,
        SIDE_ITEM_GROUP = 2,
        SIDE_ITEM_NEW_FRIEND = 3
    };

    enum ChatScope
    {
        CHAT_SCOPE_NONE = 0,
        CHAT_SCOPE_PRIVATE = 1,
        CHAT_SCOPE_GROUP = 2
    };

    struct Packet
    {
        Packet()
            : type(0), requestId(0)
        {
        }

        quint16 type;
        quint32 requestId;
        QByteArray body;
    };
}

Q_DECLARE_METATYPE(AuroraProtocol::Packet)

#endif // AURORA_PROTOCOL_H
